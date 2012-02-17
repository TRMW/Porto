class PortfoliosController < ApplicationController
  before_filter :require_login, :except => 'show'
 
  # GET /photos
  def index
    @portfolios = Portfolio.all
  end
   
  # GET /portfolios/1
  def show
    if Portfolio.first
      @portfolio = Portfolio.find(params[:id] || Settings.front_portfolio || Portfolio.first)
      @next = @portfolio.photos.length > 1 ? 2 : nil
      @previous = nil
      @portfolios = Portfolio.where(:visible => true).order(:position => 'ASC') # for nav
      
      # redirect historical slugs to current slugs
      if request.path != '/' && request.path != portfolio_path(@portfolio)
        redirect_to @portfolio, status: :moved_permanently
      end
    else
      redirect_to admin_password_path
    end
  end

  # GET /portfolios/new
  def new
    @portfolio = Portfolio.new
    6.times do
      @portfolio.photos.build
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
  def create
    @portfolio = Portfolio.new(params[:portfolio])

    if @portfolio.save
      redirect_to(@portfolio, :notice => 'Portfolio created.')
    else
      6.times do
        @portfolio.photos.build
      end
      render :action => "new"
    end
  end

  # PUT /portfolios/1
  def update
    @portfolio = Portfolio.find(params[:id])

    if @portfolio.update_attributes(params[:portfolio])
      redirect_to(@portfolio, :notice => 'Portfolio updated.')
    else
      render :action => "edit"
    end
  end

  # DELETE /portfolios/1
  def destroy
    @portfolio = Portfolio.find(params[:id])
    @portfolio.destroy

    redirect_to(admin_url)
  end
end
