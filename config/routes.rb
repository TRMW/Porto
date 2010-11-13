Dru::Application.routes.draw do

	match 'portfolios/add_new_photos' => 'portfolios#add_new_photos', :as => :add_new_photos
	match 'portfolios/set_position' => 'portfolios#set_position', :as => :set_position
	match 'settings' => 'portfolios#settings'
	match 'contact' => 'portfolios#contact'
	match 'bio' => 'portfolios#bio'
	
	match '/universityclub' => 'portfolios#index', :as => :admin
	scope '/universityclub', :as => "admin" do
  	resources :portfolios, :except => :show
  	resources :posts, :except => [ :show, :index ]
	end
	
	resources :portfolios, :only => :show
  resources :posts, :only => [ :show, :index ]
	
	root :to => "portfolios#show", :id => Settings.front_portfolio
	
end
