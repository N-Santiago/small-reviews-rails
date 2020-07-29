Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  resources :users, only: [:show, :index]
  root 'welcome#home'
  get '/genres', to: 'categories#index'
  get '/genres/:id', to: 'categories#show'
  get 'users/:id/genres/:id', to: 'users#category'
  resources :reviews
  resources :comments, only: [:show, :new, :create, :edit, :update, :destroy]
  resources :reviews do
    resources :comments
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
