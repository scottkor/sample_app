ActionController::Routing::Routes.draw do |map|

  # You can have the root of your site routed with map.root 
  # -- just remember to delete public/index.html.
  map.root :controller => 'pages', :action => 'home'
  map.contact '/contact', :controller => 'pages', :action => 'contact'
  map.about   '/about',   :controller => 'pages', :action => 'about'
  map.help    '/help',    :controller => 'pages', :action => 'help'
  
  map.signup '/signup', :controller => 'users', :action => 'new'
  
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
