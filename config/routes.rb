Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/login', to: 'sessions#new', as: 'login'
  get '/logout', to: 'sessions#destroy', as: 'logout'
  resources :sessions, only: [:new, :create]
  resources :users, only: [:new, :create, :index]

  root to: 'welcome#index'
end
