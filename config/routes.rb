Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :offers do
    member do
      post :reservations
    end
  end
  get '/dashboard', to: 'dashboard#show'

  patch 'reservations/:id/accept', to: 'offers#accept', as: 'accept_reservation'
  patch 'reservations/:id/reject', to: 'offers#reject', as: 'reject_reservation'
end
