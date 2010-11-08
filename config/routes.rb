Dru::Application.routes.draw do

	match 'portfolios/add_new_photos' => 'portfolios#add_new_photos', :as => :add_new_photos
	match 'portfolios/position' => 'portfolios#position', :as => :portfolio_position
	match 'settings' => 'portfolios#settings'
	match 'contact' => 'portfolios#contact'
	match 'bio' => 'portfolios#bio'
	
	match '/universityclub' => 'portfolios#index', :as => :admin
	scope '/universityclub' do
  	resources :portfolios, :except => [' show' ]
  	resources :posts, :except => [ 'show', 'index' ]
	end
	
	match '/portfolios/:id' => 'portfolios#show', :as => :portfolio_path
	match '/post/:id' => 'posts#show', :as => :post_path
	match '/posts' => 'posts#index', :as => :posts_path
	
	root :to => "portfolios#show", :id => Settings.front_portfolio
	
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
  # root :to => "welcome#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
