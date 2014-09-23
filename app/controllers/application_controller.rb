class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
 
  def current_user
  	@current_user ||= session[:user_id] && User.find_by_id(session[:user_id]) 
  end

  helper_method :current_user

  protected 

  def authenticate_user! 
  	if current_user
  		super
  	else 
  		redirect_to login_path, :notice => "You need to be logged in to perform that action."
  	end
  end

  def check_if_admin
  	if current_user
  		flash[:notice] = "You are not an admin user." unless current_user.admin?
  	else 
  		flash[:notice] = "Please sign in."
  	end
  end
end
