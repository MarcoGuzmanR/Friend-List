Rails.application.routes.draw do
  root 'homepage#index'
  resources :members
  get '/get_members', to: 'homepage#show_members'
end
