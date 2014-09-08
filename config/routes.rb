Rails.application.routes.draw do

  as :user do
      match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, :controllers => { :confirmations => "confirmations" }

  resources :drinks

  resources :drink_types

  root 'pages#home'

  get '/home' => 'pages#home'
end
