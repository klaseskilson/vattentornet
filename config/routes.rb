Rails.application.routes.draw do

  resources :bookings
  get '/bookings/:id/confirm' => 'bookings#confirm', :as => :confirm_booking

  as :user do
      match '/user/confirmation' => 'confirmations#update', :via => :put, :as => :update_user_confirmation
  end
  devise_for :users, :controllers => { :confirmations => 'confirmations',
                                       :registrations => 'registrations' }

  scope '/admin' do
    get '/' => 'static_pages#admin', as: :admin_dashboard
    resources :users
    resources :pages
    resources :news, except: [:show]
    resources :drinks, as: :drinks
    resources :drink_types, except: [:index, :show]
  end

  resources :drink_types, path: '/sortiment', as: :stock, only: [:index, :show] do
    resources :drinks, path: '/', only: [:show]
  end

  resources :news, path: 'nyheter', as: :public_news, only: [:show]

  root 'static_pages#home'

  get '/hem' => 'static_pages#home'

  get ':id' => 'pages#show', as: :pretty_page


end
