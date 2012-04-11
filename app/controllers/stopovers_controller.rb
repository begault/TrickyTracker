class StopoversController < ApplicationController
  
  before_filter :ensure_login
  
  # GET /stopovers
  # GET /stopovers.json
  def index
    @stopovers = Stopover.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stopovers }
    end
  end

  # GET /stopovers/1
  # GET /stopovers/1.json
  def show
    @stopover = Stopover.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stopover }
    end
  end

  # GET /stopovers/new
  # GET /stopovers/new.json
  def new
    @stopover = Stopover.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stopover }
    end
  end

  # GET /stopovers/1/edit
  def edit
    @stopover = Stopover.find(params[:id])
  end

  # POST /stopovers
  # POST /stopovers.json
  def create
    @stopover = Stopover.new(params[:stopover])

    respond_to do |format|
      if @stopover.save
        format.html { redirect_to @stopover, notice: 'Stopover was successfully created.' }
        format.json { render json: @stopover, status: :created, location: @stopover }
      else
        format.html { render action: "new" }
        format.json { render json: @stopover.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stopovers/1
  # PUT /stopovers/1.json
  def update
    @stopover = Stopover.find(params[:id])

    respond_to do |format|
      if @stopover.update_attributes(params[:stopover])
        format.html { redirect_to @stopover, notice: 'Stopover was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stopover.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stopovers/1
  # DELETE /stopovers/1.json
  def destroy
    @stopover = Stopover.find(params[:id])
    @stopover.destroy

    respond_to do |format|
      format.html { redirect_to stopovers_url }
      format.json { head :no_content }
    end
  end
end
