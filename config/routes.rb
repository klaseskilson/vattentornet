Rails.application.routes.draw do

  as :user do
      match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, :controllers => { :confirmations => "confirmations",
                                       :registrations => "registrations" }

  scope "/admin" do
    resources :users
  end

  resources :posts

  resources :drinks, path: '/sortiment'

  resources :drink_types

  root 'pages#home'

  get '/hem' => 'pages#home'
  get '/kontakt' => 'pages#contact', as: :contact
  get '/om-puben' => 'pages#about', as: :about
end
