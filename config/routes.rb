Rails.application.routes.draw do
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?

  root 'static_pages#home'
  resources :bookings, path: '/bokningar'
  get '/bookings/month/:year/:month' => 'bookings#month'
  get '/bokningar/:id/confirm' => 'bookings#confirm', :as => :confirm_booking

  as :user do
    match '/user/confirmation' => 'confirmations#update', via: :put, as: :update_user_confirmation
  end
  devise_for :users, controllers: { confirmations: 'confirmations', registrations: 'registrations' }

  scope '/admin' do
    get '/' => 'static_pages#admin', as: :admin_dashboard
    post '/drinks/beerinfo' => 'drinks#db_list'
    resources :users
    resources :pages
    resources :news, except: [:show]
    resources :drinks, as: :drinks
    post '/drinks/changestock' => 'drinks#change_stock'
    resources :drink_types, except: [:index, :show]
    get '/bookings/all' => 'bookings#all', as: :all_bookings
  end

  get '/sortiment/:id/drunk' => 'drinks#cookie', as: :drunk

  resources :drink_types, path: '/sortiment', as: :stock, only: [:index, :show] do
    resources :drinks, path: '/', only: [:show]
  end

  resources :news, path: 'nyheter', as: :public_news, only: [:show]

  get '/hem' => 'static_pages#home'

  get '/.well-known/acme-challenge/:id' => 'static_pages#letsencrypt'

  get '*id' => 'pages#show', as: :pretty_page
end
