class SessionsController < ApplicationController
  def create
    user = User.first
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to admin_path, :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end
end