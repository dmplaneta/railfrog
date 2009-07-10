ActionController::Routing::Routes.draw do |map|
# Default route for DB lookup
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

  map.rf_admin '/admin', :controller => 'railfrog_admin'
  map.map_plugin '*path', :controller => 'site_mapper', :action => 'show_chunk'
  map.resource :users, :collection => {:login => 'post'}
  
end
