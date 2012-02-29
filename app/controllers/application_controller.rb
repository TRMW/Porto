class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :ssl_if_prod
  
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
  
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def require_login
    unless !!current_user
      if User.count == 0
        # if the admin user hasn't been created yet, then redirect to user creation workflow
        redirect_to ssl_if_prod(admin_password_url)
      else
         # otherwise redirect to login
        flash[:error] = "You must be logged in to access this section."
        redirect_to ssl_if_prod(login_url)
      end
    end
  end
  
  # using this instead of force_ssl since force_ssl will redirect POST to GET
  def ssl_if_prod(url)
    if Rails.env.production?
      url.gsub!('http', 'https')
    end
    url
  end
end
