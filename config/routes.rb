Rails.application.routes.draw do
  resources :posts

  devise_for :admins
  devise_for :users

  resources :drinks

  resources :drink_types

  root 'pages#home'

  get '/home' => 'pages#home'
end
