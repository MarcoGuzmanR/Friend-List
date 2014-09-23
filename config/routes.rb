Rails.application.routes.draw do
  root 'homepage#index'
  get '/members', to: 'homepage#show_members', as: 'members'
end
