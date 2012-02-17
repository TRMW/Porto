Porto::Application.routes.draw do
	
	resources :portfolios, :only => [ :index, :show ] do
		resources :photos
	end
	
	resources :posts, :only => [ :show, :index ]
  resources :users, :only => :create
  resource :session, :only => [ :create, :destroy ]
  
	# admin
	match 'admin' => 'admin#index', :as => :admin
	match 'admin/password' => 'admin#password', :as => :admin_password
	match 'admin/setup' => 'admin#setup', :as => :admin_setup
	match 'admin/login' => 'admin#login', :as => :login
  match 'admin/add_new_photos' => 'admin#add_new_photos', :as => :add_new_photos
	match 'admin/set_position' => 'admin#set_position', :as => :set_position
	match 'settings' => 'admin#settings'
	scope 'admin', :as => 'admin' do
  	resources :portfolios, :except => [ :show, :index ]
  	resources :posts
	end
	
	# catch-all for rendering News, Bio, and Contact, regardless of what the user has named them
	match ':page(/:id)' => 'pages#show', :as => :page
	
	root :to => 'portfolios#show'
	
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
