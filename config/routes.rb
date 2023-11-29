Rails.application.routes.draw do
  get 'sessions/create'
  root 'users#new'

  resources :users, only: %i[new create]
  resources :blogs, only: %i[index create]

  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
end
