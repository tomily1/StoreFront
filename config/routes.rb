Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  resource :authentications, only: [:new, :create]
  resources :carts, only: [:index, :create, :update, :destroy]
  resources :products, only: [:new, :create]
end
