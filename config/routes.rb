Dru::Application.routes.draw do

	match 'portfolios/add_new_photos' => 'portfolios#add_new_photos', :as => :add_new_photos
	match 'portfolios/set_position' => 'portfolios#set_position', :as => :set_position
	
	resources :portfolios, :only => :show do
		resources :photos
	end
	
	match 'settings' => 'portfolios#settings'
	
	resources :posts, :only => [ :show, :index ]
  
	# admin section
	match 'universityclub' => 'portfolios#index', :as => :admin
	scope 'universityclub', :as => 'admin' do
  	resources :portfolios, :except => :show
  	resources :posts
	end
	
	# redirect URLs from old site
	match '1.html' => redirect('/')
	match '2.html' => redirect('/')
	
	# catch-all for rendering News, Bio, and Contact, regardless of what the user has named them
	match ':page(/:id)' => 'pages#show', :as => :page
	
	root :to => 'portfolios#show'
	
end
