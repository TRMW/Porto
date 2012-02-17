class AdminController < ApplicationController
  before_filter :require_login, :except => [ 'password', 'login' ]
  
  def index
    @portfolios = Portfolio.all(:order => 'position')
    @posts = Post.all
  end
  
  def password
    @user = User.new
  end
  
  def add_new_photos
    @start = params[:last_photo].to_i
    @new_photos = params[:new_photos].to_i
    
    respond_to do |format|
      format.js
    end
  end
  
  def set_position
    params[:portfolios].each do |key, value|
      logger.info "key = #{key} and value = #{value}"
      Portfolio.find(key).update_attribute('position', value)
    end
  end
  
  def settings
    Settings.site_name = params[:site_name]
    Settings.front_portfolio = params[:front_portfolio]
    Settings.show_portfolios = params[:show_portfolios] || 'false'
    Settings.news_title = params[:news_title]
    Settings.bio_title = params[:bio_title]
    Settings.contact_title = params[:contact_title]
    Settings.show_news = params[:show_news] || 'false'
    Settings.show_bio = params[:show_bio] || 'false'
    Settings.show_contact = params[:show_contact] || 'false'
    Settings.phone = params[:phone]
    Settings.email = params[:email]
    Settings.bio = params[:bio]
    if params[:initial_setup]
      redirect_to :controller => 'portfolios', :action => 'new'
    else
      redirect_to admin_url, :notice => 'Settings updated.'
    end
  end
end
