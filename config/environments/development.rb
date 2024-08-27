require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Permite la recarga de código sin necesidad de reiniciar el servidor.
  config.enable_reloading = true

  # Carga ansiosa desactivada para mejorar la velocidad de desarrollo.
  config.eager_load = false

  # Muestra errores completos en el entorno de desarrollo.
  config.consider_all_requests_local = true

  # Habilita la medición del tiempo del servidor.
  config.server_timing = true

  # Configuración de la caché.
  if Rails.root.join("tmp/caching-dev.txt").exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true
    config.cache_store = :memory_store
    config.public_file_server.headers = {
      "Cache-Control" => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false
    config.cache_store = :null_store
  end

  # Servicio de almacenamiento activo (Active Storage).
  config.active_storage.service = :local

  # No levantar errores en caso de fallas en la entrega de correos.
  config.action_mailer.raise_delivery_errors = false

  # Configuración de la depreciación.
  config.active_support.deprecation = :log
  config.active_support.disallowed_deprecation = :raise
  config.active_support.disallowed_deprecation_warnings = []

  # Manejo de errores de migración.
  config.active_record.migration_error = :page_load
  config.active_record.verbose_query_logs = true
  config.active_job.verbose_enqueue_logs = true

  # Levantar errores si faltan callbacks en controladores.
  config.action_controller.raise_on_missing_callback_actions = true

  # Opciones adicionales comentadas (puedes activarlas si las necesitas).
  # config.i18n.raise_on_missing_translations = true
  # config.action_view.annotate_rendered_view_with_filenames = true
  # config.action_cable.disable_request_forgery_protection = true
end

# Configuración de default_url_options para generar URLs completas en ActiveStorage
Rails.application.routes.default_url_options = {
  host: 'localhost',
  port: 3001 # Cambia esto al puerto que estés utilizando si es diferente
}
