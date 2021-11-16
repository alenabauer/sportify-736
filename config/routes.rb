Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get 'offers/new', to: 'offers#new', as: :new_offer
  post '/offers', to: 'offers#create'
  get 'offers/:id/edit', to: 'offers#edit', as: :edit_offer
  patch '/offers/:id', to: 'offers#update'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
