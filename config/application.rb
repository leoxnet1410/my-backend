require_relative "boot"

require "rails/all"
require "rack/cors"


module MyBackend
  class Application < Rails::Application
    # Configuración de CORS
    config.middleware.use Rack::Cors do
      allow do
        origins 'http://localhost:3001'
        resource '*', 
          headers: :any, 
          methods: [:get, :post, :put, :patch, :delete, :options, :head], 
          credentials: true
      end
    end
  end
end