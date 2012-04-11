class PeopleController < ApplicationController
  
  load 'crypto.rb'
  include Crypto
  
  before_filter :ensure_login, :only => [:edit, :update, :destroy, :new, :create]
  before_filter :ensure_logout, :only => [:help, :recover]
 
  def index
    @root = "people"
    
    @people = Person.find(:all)
  end
 
  def show   
    @root = "people"
    @branch = "show"
    @leaf = params[:id]
    
    @person = Person.find(params[:id])
  end
 
  def new
    @root = "people"
    @trunk = "new" 
    
    @person = Person.new
    @roles = Role.all
  end
 
  def create
    @root = "people"
    @trunk = "new"     
    
    @person = Person.new(params[:person])
    @role_person = RolesPerson.new(params[:roles_people])
    
    @roles = Role.all
    if @person.save 
        @role_person.person_id = @person.id
        @role_person.save
        @session = @person.sessions.create
        #session[:id] = @session.id
        flash[:notice] = "#{@person.name} is now registered"
        #redirect_to(root_url)
        render(:action => 'new')
    else
      flash[:error] = "Role has not been linked ... "
      render(:action => 'new')
    end
  end
 
  def edit
    @root = "people"
    @branch = "edit"
    @leaf = params[:id]    
    
    @person = Person.find(@user)
    @roles = Role.all
  end
 
  def update
    @root = "people"
    @branch = "edit"
    @leaf = params[:id]  
        
    @person = Person.find(@user)
    if @person.update_attributes(params[:person])
      flash[:notice] = "Your account has been updated"
      redirect_to(root_url)
    else
      render(:action => 'edit')
    end
  end
 
  def destroy
    @root = "people"
    
    Person.destroy(@user)
    session[:id] = @user = nil
    flash[:notice] = "You are now unregistered"
    redirect_to(root_url)
  end
  
  def recover
    person = Person.find_by_name(params[:name])
    if person
      puts person
      Mailer.deliver_recovery(:key => Crypto.encrypt("#{person.id}:#{person.salt}"),
                              :email => person.email_address,
                              :to_user => person.email_address,
                              :domain => request.env['HTTP_HOST'])
      flash[:notice] = "Please check your email"
      redirect_to(root_url)
    else
      flash[:notice] = "Your account could not be found"
      redirect_to(:controller => :person, :action => :help) 
    end
  end  

  def help
    
  end

end
