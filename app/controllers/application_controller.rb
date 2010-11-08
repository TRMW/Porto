class ApplicationController < ActionController::Base
  protect_from_forgery
#   before_filter :get_portfolios
#   
#   def get_portfolios
# 		@portfolios = Portfolio.all(:order => 'position')
# 	end
end
