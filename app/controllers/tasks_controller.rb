class TasksController < ApplicationController
  
  before_filter :ensure_login
  
  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.all
    @root = "tasks"

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end
  end

  def your_tasks
    @tasks = Task.find(:all, :conditions => ["closed !=? and id in (select task_id from people_tasks where person_id = #{current_user.id})", true])
    
   # @tasks = Task.people.where(:id => params[:user_id])
    @root = "tasks"
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks }
    end    
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @task = Task.find(params[:id])
    @team_members = Person.task_assignees(@task.id)
    @users = Person.not_assignees(@task.id)
    @comments = Comment.find_by_type(@task)
    @comment = Comment.new
     
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/new
  # GET /tasks/new.json
  def new
    
    if params[:id].nil?
      @projects = Project.all
    else
      @project = Project.find(params[:id])
    end

    @priorities = Priority.all
    @stopovers = Stopover.all
    @task = Task.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @task }
    end
  end

  # GET /tasks/1/edit
  def edit   
    @task = Task.find(params[:id])
    @project = Project.find(@task.project_id)
    @priorities = Priority.all
    @stopovers = Stopover.all
    @categories = @task.categories_not_parent()
    @task_cats = @task.categories
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @task = Task.new(params[:task])
    @task.author = current_user
    @categories = Category.all

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render json: @task, status: :created, location: @task }
      else
        format.html { render action: "new" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.json
  def update
    @task = Task.find(params[:id])
    if @task.closed = true
      @task.effective_achievement_date = Date.today
      @task.stopover_id = Stopover.find(:first, :conditions => "name = 'Closed'").id
    end

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    puts "destroy task"
    @task = Task.find(params[:id])
    @project = Project.find(@task.project_id)
    @task.destroy

    respond_to do |format|
      format.html { redirect_to project_url(@project) }
      format.json { head :no_content }
    end
  end
  
  def add_task_assignee
    @task = Task.find(:first, :conditions => "id = #{params[:id]}")
    @people_task= PeopleTask.new(:task_id => @task.id, :person_id => params[:person_id])
    puts @people_task.to_json
    @team_members = Person.all(:conditions => ["id in (?)", PeopleTask.find(:all, :conditions => "task_id = #{@task.id}")])
    @users =  Person.all(:conditions => ["id not in (?)", PeopleTask.find(:all, :conditions => "task_id = #{@task.id}")])   
    
    respond_to do |format| 
      if @people_task.save
        format.html { redirect_to(task_url(@task.id)) }
        format.js
        format.xml  { render :xml => @people_task, :status => :created, :location => @people_task }
      else
        format.html { render :action => "show", :id => @task.id } 
        format.xml { render :xml => @people_task.errors, :status => :unprocessable_entity }
      end 
    end
  end
  
  def remove_task_assignee
    puts "remove"
    @task = Task.find(:first, :conditions => "id = #{params[:id]}")
    @people_task = PeopleTask.find(:first, :conditions => ["task_id = #{@task.id} and person_id = #{params[:person_id]}"])
    @people_task.destroy
    @team_members = Person.all(:conditions => ["id in (?)", PeopleTask.find(:all, :conditions => "task_id = #{@task.id}")])
    @users =  Person.all(:conditions => ["id not in (?)", PeopleTask.find(:all, :conditions => "task_id = #{@task.id}")])   
    
    respond_to do |format| 
        format.html { redirect_to(task_url(@task.id)) }
        format.js
        format.xml  { render :xml => @people_task, :status => "deleted", :location => @task }
    end
  end    
  
  def add_category
    @task = Task.find(:first, :conditions => "id = #{params[:id]}")
    @task_cat = CategoriesTask.new(:task_id => @task.id, :category_id => params['cat_id'])
    @team_members = Person.task_assignees(@task.id)
    @users = Person.not_assignees(@task.id)
    @comments = Comment.find_by_type(@task)
    @comment = Comment.new
    @categories = @task.categories_not_parent()
    
    
    respond_to do |format| 
      if @task_cat.save
        format.html { redirect_to(:controller => "tasks", :action => "edit", :id => @task.id) }
        format.js
        format.xml  { render :xml => @category_task, :status => :created, :location => @category_task }
      else
        format.html { render :action => "edit", :id => @task.id } 
        format.xml { render :xml => @category_task.errors, :status => :unprocessable_entity }
      end 
    end  
  end
  
  def remove_task_category
    @task = Task.find(:first, :conditions => "id = #{params[:id]}")
    @task_cat = CategoriesTask.find(:first, :conditions => ["task_id = #{@task.id} and category_id = #{params[:category_id]}"])
    @task_cat.destroy
    @team_members = Person.task_assignees(@task.id)
    @users = Person.not_assignees(@task.id)
    @comments = Comment.find_by_type(@task)
    @comment = Comment.new
    @categories = @task.categories_not_parent()
      
    respond_to do |format| 
        format.html { redirect_to(:controller => "tasks", :action => "edit", :id => @task.id) }
        format.js
        format.xml  { render :xml => @category_task, :status => :created, :location => @category_task }
    end
  end 
end
