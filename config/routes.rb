Rails.application.routes.draw do

  as :user do
      match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, :controllers => { :confirmations => "confirmations",
                                       :registrations => "registrations" }

  scope "/admin" do
    resources :users
    resources :pages
    resources :drinks, as: :drinks
    resources :drink_types, except: [:index, :show]
  end

  resources :posts

  resources :drink_types, path: '/sortiment', as: :stock, only: [:index, :show] do
    resources :drinks, path: '/', only: [:show]
  end

  root 'static_pages#home'

  get '/hem' => 'static_pages#home'

  get ':id' => 'pages#show', as: :pretty_page

end
