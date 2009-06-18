ActionController::Routing::Routes.draw do |map|
# Default route for DB lookup
  map.map_plugin '/admin', :controller => 'railfrog_admin'
  map.map_plugin '*path', :controller => 'site_mapper', :action => 'show_chunk'
end
