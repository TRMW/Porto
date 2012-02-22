class AdminController < ApplicationController
  before_filter :require_login, :except => [ 'password', 'login' ]
  
  def index
    if User.first
      @projects = Project.all(:order => 'position')
      @posts = Post.all
    else
      redirect_to admin_password_path
    end
  end
  
  def password
    if User.count == 0
      @user = User.new
    else
      redirect_to root_path, :alert => 'Admin user has already been created.'
    end
  end
  
  def add_new_images
    @start = params[:last_image].to_i
    @new_images = params[:new_images].to_i
    
    respond_to do |format|
      format.js
    end
  end
  
  def set_position
    params[:projects].each do |key, value|
      Project.find(key).update_attribute('position', value)
    end
  end
  
  def settings
    Settings.site_name = params[:site_name]
    Settings.front_project = params[:front_project].to_i
    @front_project = Project.find(Settings.front_project)
    # make the front portfolio visible if it's not already
    if !@front_project.visible?
      @front_project.visible = true
      @front_project.save
    end
    Settings.show_projects = params[:show_projects] || 'false'
    Settings.blog_title = params[:blog_title]
    Settings.about_title = params[:about_title]
    Settings.contact_title = params[:contact_title]
    Settings.show_blog = params[:show_blog] || 'false'
    Settings.show_about = params[:show_about] || 'false'
    Settings.show_contact = params[:show_contact] || 'false'
    Settings.phone = params[:phone]
    Settings.email = params[:email]
    Settings.about_text = params[:about_text]
    if params[:initial_setup]
      redirect_to :controller => 'projects', :action => 'new'
    else
      redirect_to admin_url, :notice => 'Settings updated.'
    end
  end
end
