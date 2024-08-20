Rails.application.routes.draw do
  resources :products
  resources :sales, only: [:create]
end