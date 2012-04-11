class ProjectsPeopleController < ApplicationController
  
  before_filter :ensure_login
  
  # GET /projects_people
  # GET /projects_people.json
  def index
    @projects_people = ProjectsPerson.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects_people }
    end
  end

  # GET /projects_people/1
  # GET /projects_people/1.json
  def show
    @projects_person = ProjectsPerson.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @projects_person }
    end
  end

  # GET /projects_people/new
  # GET /projects_people/new.json
  def new
    @projects_person = ProjectsPerson.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @projects_person }
    end
  end

  # GET /projects_people/1/edit
  def edit
    @projects_person = ProjectsPerson.find(params[:id])
  end

  # POST /projects_people
  # POST /projects_people.json
  def create
    @projects_person = ProjectsPerson.new(params[:projects_person])

    respond_to do |format|
      if @projects_person.save
        format.html { redirect_to @projects_person, notice: 'Projects person was successfully created.' }
        format.json { render json: @projects_person, status: :created, location: @projects_person }
      else
        format.html { render action: "new" }
        format.json { render json: @projects_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects_people/1
  # PUT /projects_people/1.json
  def update
    @projects_person = ProjectsPerson.find(params[:id])

    respond_to do |format|
      if @projects_person.update_attributes(params[:projects_person])
        format.html { redirect_to @projects_person, notice: 'Projects person was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @projects_person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects_people/1
  # DELETE /projects_people/1.json
  def destroy
    @projects_person = ProjectsPerson.find(params[:id])
    @projects_person.destroy

    respond_to do |format|
      format.html { redirect_to projects_people_url }
      format.json { head :no_content }
    end
  end
end
