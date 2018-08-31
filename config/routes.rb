Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "pages#home"
  resources :carts, only: [:index, :create, :update, :destroy]
  resources :products, only: [:new, :create]
  resources :delivery_methods, only: [:index, :create, :destroy]
  resources :user_orders, only: [:update] do
    post :payment
  end
end
