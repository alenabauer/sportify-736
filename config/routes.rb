Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :offers do
    member do
      post :reservations
    end
  end
  get '/dashboard', to: 'dashboard#show'
end
