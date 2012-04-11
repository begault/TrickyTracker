class PeopleTasksController < ApplicationController
  
  before_filter :ensure_login
  
  # GET /people_tasks
  # GET /people_tasks.json
  def index
    @people_tasks = TasksPerson.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @people_tasks }
    end
  end

  # GET /people_tasks/1
  # GET /people_tasks/1.json
  def show
    @tasks_person = TasksPerson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tasks_person }
    end
  end

  # GET /people_tasks/new
  # GET /people_tasks/new.json
  def new
    @tasks_person = TasksPerson.new 

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tasks_person }
    end
  end

  # GET /people_tasks/1/edit
  def edit
    @tasks_person = TasksPerson.find(params[:id])
  end

  # POST /people_tasks
  # POST /people_tasks.json
  def create
    @tasks_person = TasksPerson.new(params[:tasks_person])

    respond_to do |format|
      if @tasks_person.save
        format.html { redirect_to @tasks_person, notice: 'Tasks person was successfully created.' }
        format.json { render json: @tasks_person, status: :created, location: @tasks_person }
      else
        format.html { render action: "new" }
        format.json { render json: @tasks_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /people_tasks/1
  # PUT /people_tasks/1.json
  def update
    @tasks_person = TasksPerson.find(params[:id])

    respond_to do |format|
      if @tasks_person.update_attributes(params[:tasks_person])
        format.html { redirect_to @tasks_person, notice: 'Tasks person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tasks_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people_tasks/1
  # DELETE /people_tasks/1.json
  def destroy
    @tasks_person = TasksPerson.find(params[:id])
    @tasks_person.destroy

    respond_to do |format|
      format.html { redirect_to people_tasks_url }
      format.json { head :no_content }
    end
  end
end
