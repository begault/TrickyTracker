class ProjectsController < ApplicationController
  
  before_filter :ensure_login
  
  # GET /projects
  # GET /projects.json
  def index
    @root = "projects"
    
    @roles = Role.all
    @projects = Project.all
    @path = projects_path

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    @root = "projects"
    @trunk = "show"
    @leaf = params[:id]
    
    @project = Project.find(params[:id])
    @tasks = @project.tasks
    @team_members = Person.team_members(@project.id)
    @users = Person.not_in_the_team(@project.id)#.find_by_sql()#.all(:conditions => [" id not in (?)", ProjectsPerson.find(:all, :conditions => "project_id = #{@project.id}")]) 
    @project_person = PeopleProject.new
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @root = "projects"
    @branch = "new"
    
    @project = Project.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/1/edit
  def edit
    @root = "projects"
    @branch = "edit"
    @leaf = params[:id]
        
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @root = "projects"
    @branch = "new"    
    
    @project = Project.new(params[:project])
    @project.manager = current_user.id
    
    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @root = "projects"
    @branch = "new"    
    
    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @root = "projects"
    
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end
  
  def add_team_member
    puts "\n add team member \n "
    puts params
    @project = Project.find(:first, :conditions => "id = #{params[:id]}")
    puts @project.to_json
    @project_person = PeopleProject.new(:project_id => @project.id, :person_id => params[:person_id])
    puts @project_person.to_json
    @team_members = Person.all(:conditions => ["id in (?)", PeopleProject.find(:all, :conditions => "project_id = #{@project.id}")])
    @users =  Person.all(:conditions => ["id not in (?)", PeopleProject.find(:all, :conditions => "project_id = #{@project.id}")])   
    
    respond_to do |format| 
      if @project_person.save
        format.html { redirect_to(project_url(@project.id)) }
        format.js
        format.xml  { render :xml => @project_person, :status => :created, :location => @project_person }
      else
        format.html { render :action => "show", :id => @project.id } 
        format.xml { render :xml => @project_person.errors, :status => :unprocessable_entity }
      end 
    end
  end
  
  def remove_team_member
    puts "remove"
    @project = Project.find(:first, :conditions => "id = #{params[:id]}")
    @project_person = PeopleProject.find(:first, :conditions => ["project_id = #{@project.id} and person_id = #{params[:person_id]}"])
    @tasks = Task.where(:project_id => @project.id)
    @tasks.each() do  |task| 
      @task_person = PeopleTask.find(:first, :conditions => ["task_id = #{task.id} and person_id = #{params[:person_id]}"])
      if @task_person
        @task_person.destroy      
      end
    end
    @project_person.destroy
    @team_members = Person.all(:conditions => ["id in (?)", PeopleProject.find(:all, :conditions => "project_id = #{@project.id}")])
    @users =  Person.all(:conditions => ["id not in (?)", PeopleProject.find(:all, :conditions => "project_id = #{@project.id}")])   
    
    respond_to do |format| 
        format.html { redirect_to(project_url(@project.id)) }
        format.js
        format.xml  { render :xml => @project_person, :status => "deleted", :location => @project }
    end
  end  
  
end
