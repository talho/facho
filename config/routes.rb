Openphin::Application.routes.draw do
  namespace :facho do
    resources :users, :only=> [:new, :create]
  end
end
