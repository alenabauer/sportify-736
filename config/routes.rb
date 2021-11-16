Rails.application.routes.draw do
  get 'offers/:id', to: "offers#show"
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/offers', to: 'pages#index', as: :offers
end
