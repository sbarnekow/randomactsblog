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
  	if current_user.admin == true
  	else 
  		redirect_to login_path, :notice => "You need to be logged in to perform that action."
  	end
  end

end
