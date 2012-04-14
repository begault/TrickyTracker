class RolesController < ApplicationController
  
  before_filter :ensure_login
  
  # GET /stopovers
  # GET /stopovers.json
  def index
    @roles = Role.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @roles }
    end
  end  
  
  def new
    @role = Role.new

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @role }
    end
  end
  
  def create 
    @role = Role.new(params[:role])

    respond_to do |format|
      if @role.save
        format.html { redirect_to new_role_path, notice: 'Role was successfully created.' }
        format.json { render json: @role, status: :created, location: @role }
      else
        format.html { render action: "new" }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end    
  end
 
  def destroy
    @role = Role.find(params[:id])
    @role.destroy

    respond_to do |format|
      format.html { redirect_to roles_url }
      format.json { head :no_content }
    end
  end  
  
end