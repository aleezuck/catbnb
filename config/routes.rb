Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :flats do
    resources :bookings, only: [:create]
  end

  get '/my_trips', to: 'bookings#my_trips', as: :my_trips
end
