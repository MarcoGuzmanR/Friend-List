Rails.application.routes.draw do
  root 'homepage#index'
  resources :members, only: [:show]
  resources :friends
  get '/get_members', to: 'homepage#show_members'
end
