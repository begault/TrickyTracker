class RolesController < ApplicationController
  # GET /projects_people
  # GET /projects_people.json
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
end