class CategoriesTasksController < ApplicationController
  # GET /categories_tasks
  # GET /categories_tasks.json
  def index
    @categories_tasks = CategoriesTask.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories_tasks }
    end
  end

  # GET /categories_tasks/1
  # GET /categories_tasks/1.json
  def show
    @categories_task = CategoriesTask.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @categories_task }
    end
  end

  # GET /categories_tasks/new
  # GET /categories_tasks/new.json
  def new
    @categories_task = CategoriesTask.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @categories_task }
    end
  end

  # GET /categories_tasks/1/edit
  def edit
    @categories_task = CategoriesTask.find(params[:id])
  end

  # POST /categories_tasks
  # POST /categories_tasks.json
  def create
    @categories_task = CategoriesTask.new(params[:categories_task])

    respond_to do |format|
      if @categories_task.save
        format.html { redirect_to @categories_task, notice: 'Categories task was successfully created.' }
        format.json { render json: @categories_task, status: :created, location: @categories_task }
      else
        format.html { render action: "new" }
        format.json { render json: @categories_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories_tasks/1
  # PUT /categories_tasks/1.json
  def update
    @categories_task = CategoriesTask.find(params[:id])

    respond_to do |format|
      if @categories_task.update_attributes(params[:categories_task])
        format.html { redirect_to @categories_task, notice: 'Categories task was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @categories_task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories_tasks/1
  # DELETE /categories_tasks/1.json
  def destroy
    @categories_task = CategoriesTask.find(params[:id])
    @categories_task.destroy

    respond_to do |format|
      format.html { redirect_to categories_tasks_url }
      format.json { head :no_content }
    end
  end
end
