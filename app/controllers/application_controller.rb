class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :get_portfolios
  
  def get_portfolios
    @portfolios = Portfolio.all(:order => 'position')
  end
  
  def not_found
    raise ActionController::RoutingError.new('Not Found')
  end
end
