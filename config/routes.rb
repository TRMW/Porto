Porto::Application.routes.draw do
	
	resources :projects, :only => :show do
		resources :images, :except => [ :index, :new, :edit ]
	end
	
  resources :users, :only => :create
  resource :session, :only => [ :create, :destroy ]
  
	# admin
	match 'admin' => 'admin#index', :as => :admin
	match 'admin/password' => 'admin#password', :as => :admin_password
	match 'admin/setup' => 'admin#setup', :as => :admin_setup
	match 'admin/login' => 'admin#login', :as => :login
  match 'admin/add_new_images' => 'admin#add_new_images', :as => :add_new_images
	match 'admin/set_position' => 'admin#set_position', :as => :set_position
	match 'admin/settings' => 'admin#settings'
	scope 'admin', :as => 'admin' do
  	resources :projects, :except => [ :show ]
  	resources :posts, :except => [ :show, :index ]
	end
	
	# catch-all for rendering News, Bio, and Contact, regardless of what the user has named them
	match ':page(/:id)' => 'pages#show', :as => :page
	
	root :to => 'projects#show'

end
