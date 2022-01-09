Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :flats do
    resources :bookings, only: [:create]
  end

  get '/search', to: 'flats#search', as: :search

  get '/my_trips', to: 'bookings#my_trips', as: :my_trips
  get '/my_reservations', to: 'bookings#my_reservations', as: :my_reservations

  patch '/bookings/:id/approve', to: 'bookings#approve', as: :approve_booking
  patch '/bookings/:id/decline', to: 'bookings#decline', as: :decline_booking
end
