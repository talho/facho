ActionController::Routing::Routes.draw do |map|
  map.resources :facho_users, :as=> 'facho/users', :controller=> 'facho/users', :only=> [:new, :create]
end
