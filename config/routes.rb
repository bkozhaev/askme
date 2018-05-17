Rails.application.routes.draw do

  root 'users#index'
  resources :users
  resource :sessions, only: [:new, :create, :destroy]
  resources :questions, except: [:show, :new, :index]
  
  get '/tags/hashtags/:name', to:'tags#hashtags'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
