Authz::Engine.routes.draw do

  resources :controller_actions
  resources :business_processes
  resources :roles
  
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

end
