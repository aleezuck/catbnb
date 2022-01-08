Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :flats do
    resources :bookings, only: [:create]
  end

  get '/my_trips', to: 'bookings#my_trips', as: :my_trips
  get '/my_reservations', to: 'bookings#my_reservations', as: :my_reservations
end
