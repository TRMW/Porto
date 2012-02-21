class ApplicationController < ActionController::Base
  protect_from_forgery
    
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :current_user
  
  def require_login
    unless !!current_user
      flash[:error] = "You must be logged in to access this section."
      redirect_to login_path
    end
  end
end
