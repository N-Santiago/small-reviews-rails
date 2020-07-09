Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root 'welcome#home'
  get '/genres', to: 'categories#index'
  get '/genres/:id', to: 'categories#show'
  resources :reviews
  resources :comments, only: [:show, :new, :create, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
