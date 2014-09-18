Rails.application.routes.draw do

  as :user do
      match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, :controllers => { :confirmations => "confirmations",
                                       :registrations => "registrations" }

  scope "/admin" do
    resources :users
    resources :pages
  end

  resources :posts

  resources :drinks, path: '/sortiment'

  resources :drink_types

  root 'static_pages#home'

  get '/hem' => 'static_pages#home'

  get ':id' => 'pages#show', as: :pretty_page

end
