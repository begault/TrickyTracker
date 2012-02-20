class TasksPeopleController < ApplicationController
  # GET /tasks_people
  # GET /tasks_people.json
  def index
    @tasks_people = TasksPerson.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tasks_people }
    end
  end

  # GET /tasks_people/1
  # GET /tasks_people/1.json
  def show
    @tasks_person = TasksPerson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tasks_person }
    end
  end

  # GET /tasks_people/new
  # GET /tasks_people/new.json
  def new
    @tasks_person = TasksPerson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tasks_person }
    end
  end

  # GET /tasks_people/1/edit
  def edit
    @tasks_person = TasksPerson.find(params[:id])
  end

  # POST /tasks_people
  # POST /tasks_people.json
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

  # PUT /tasks_people/1
  # PUT /tasks_people/1.json
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

  # DELETE /tasks_people/1
  # DELETE /tasks_people/1.json
  def destroy
    @tasks_person = TasksPerson.find(params[:id])
    @tasks_person.destroy

    respond_to do |format|
      format.html { redirect_to tasks_people_url }
      format.json { head :no_content }
    end
  end
end
