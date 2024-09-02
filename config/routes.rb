Rails.application.routes.draw do
  # Rutas para Active Storage
  # Esto es necesario para que Rails maneje las rutas de blobs
  direct :rails_blob do |blob, options|
    route_for(:rails_blob, blob.signed_id, options)
  end

  direct :rails_blob_proxy do |blob, options|
    route_for(:rails_blob_proxy, blob.signed_id, options)
  end

  # Rutas existentes
  resources :products
  resources :sales, only: [:create, :index]

  # Nuevas rutas para customers
  resources :customers, only: [:index, :create, :update, :destroy]
end
