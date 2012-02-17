class UsersController < ApplicationController

  def create
    @user = User.new(params[:user])
    if @user.save
      session[:user_id] = @user.id
      redirect_to admin_setup_path
    else
      render admin_password_path
    end
  end
  
end
