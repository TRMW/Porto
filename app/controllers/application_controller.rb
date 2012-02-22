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
      if User.count == 0
        # if the admin user hasn't been created yet, then redirect to user creation workflow
        redirect_to admin_password_path
      else
         # otherwise redirect to login
        flash[:error] = "You must be logged in to access this section."
        redirect_to login_path
      end
    end
  end
end
