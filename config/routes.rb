ActionController::Routing::Routes.draw do |map|
  # The priority is based upon order of creation: first created -> highest priority.
  
  # Sample of regular route:
  # map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  # map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # You can have the root of your site routed by hooking up '' 
  # -- just remember to delete public/index.html.
  map.connect '', :controller => 'home', :action => 'index'
  map.connect 'mobile', :controller => 'mobile/vehicle', :action => 'list'
  map.connect 'garage', :controller => 'user', :action => 'home'
  map.connect 'garage/show/:id', :controller => 'vehicle', :action => 'show'
  #mobile routes
  map.connect 'mobile', :controller => 'mobile/vehicle', :action => 'list'
  map.connect '/mobile/garage', :controller => '/mobile/vehicle', :action => 'list'
  map.connect '/mobile/garage/show/:id', :controller => '/mobile/vehicle', :action => 'show'
  # Allow downloading Web Service WSDL as a file with an extension
  # instead of a file named 'wsdl'
  map.connect ':controller/service.wsdl', :action => 'wsdl'

  # Install the default route as the lowest priority.
  map.connect ':controller/:action/:id.:format'
  map.connect ':controller/:action/:id'
end
