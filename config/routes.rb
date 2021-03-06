ActionController::Routing::Routes.draw do |map|
  map.resources :service_logs

  map.resources :project_steps

  map.resources :projects

  map.resources :trucks do |truck|
    truck.resources :projects
    truck.resources :service_logs
  end
  
  map.resources :roles

  map.resources :users do |user|
    user.resources :trucks
  end
  

  map.resource :session
  
  map.resources :makes do |make|
    make.resources :models
  end
  
  map.resource :search

  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "users"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  map.connect 'activate/:id', :controller => 'users', :action => 'activate'
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
