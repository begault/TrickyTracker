class ApplicationController < ActionController::Base
  helper :all
  
  before_filter :maintain_session_and_user
  
  protect_from_forgery
  
  def admin_panel
    
  end
  
  def home
    
  end
  
  def ensure_login
    unless @user
      flash[:notice] = "Please login to continue"
      redirect_to(new_session_path)
    end
  end
  
  def ensure_logout
    if @user
      flash[:notice] = "You must logout before you can login or register"
      redirect_to(root_url)
    end
  end
  
  def current_user
    if session[:id]
      if @application_session = Session.find_by_id(session[:id])   
        return @application_session.person.id
      end
    end     
    return 0
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end  
  
  private
  
  def maintain_session_and_user
    if session[:id]
      if @application_session = Session.find_by_id(session[:id])
        @application_session.update_attributes(
          :ip_address => request.remote_addr,
          :path => request.path_info
        )
        @user = @application_session.person
      else
        session[:id] = nil
        redirect_to(root_url)
      end
    end
  end
end
