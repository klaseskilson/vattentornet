Rails.application.routes.draw do

  resources :news

  as :user do
      match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, :controllers => { :confirmations => "confirmations",
                                       :registrations => "registrations" }

  scope "/admin" do
    resources :users
  end

  resources :posts

  resources :drinks

  resources :drink_types

  root 'pages#home'

  get '/home' => 'pages#home'
end
