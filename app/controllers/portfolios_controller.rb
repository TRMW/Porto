class PortfoliosController < ApplicationController
  # GET /portfolios
  # GET /portfolios.xml
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @portfolios }
    end
  end

  # GET /portfolios/1
  # GET /portfolios/1.xml
  def show
    @portfolio = Portfolio.find(params[:id] || Settings.front_portfolio)
    @next = @portfolio.photos.length > 1 ? 2 : nil
    @previous = nil
    
    # redirect historical slugs to current slugs
    if request.path != '/' && request.path != portfolio_path(@portfolio)
      redirect_to @portfolio, :status => :moved_permanently
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @portfolio }
      end
    end
  end

  # GET /portfolios/new
  # GET /portfolios/new.xml
  def new
    @portfolio = Portfolio.new
    6.times do
      @portfolio.photos.build
    end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @portfolio }
    end
  end

  # GET /portfolios/1/edit
  def edit
    @portfolio = Portfolio.find(params[:id])
    new = 3 - (@portfolio.photos.length % 3)
    new.times do
      @portfolio.photos.build
    end
  end

  # POST /portfolios
  # POST /portfolios.xml
  def create
    @portfolio = Portfolio.new(params[:portfolio])

    respond_to do |format|
      if @portfolio.save
        format.html { redirect_to(@portfolio, :notice => 'Portfolio created.') }
        format.xml  { render :xml => @portfolio, :status => :created, :location => @portfolio }
      else
        6.times do
          @portfolio.photos.build
        end
        format.html { render :action => "new" }
        format.xml  { render :xml => @portfolio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /portfolios/1
  # PUT /portfolios/1.xml
  def update
    @portfolio = Portfolio.find(params[:id])

    respond_to do |format|
      if @portfolio.update_attributes(params[:portfolio])
        format.html { redirect_to(@portfolio, :notice => 'Portfolio updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @portfolio.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /portfolios/1
  # DELETE /portfolios/1.xml
  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy

    respond_to do |format|
      format.html { redirect_to(admin_url) }
      format.xml  { head :ok }
    end
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
    redirect_to(admin_url, :notice => 'Settings updated.')
  end
end
