Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded on
  # every request. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  if Rails.root.join('tmp/caching-dev.txt').exist?
    config.action_controller.perform_caching = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.seconds.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  config.action_mailer.perform_caching = false
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.perform_deliveries = true
  config.action_mailer.raise_delivery_errors = false
  config.action_mailer.default_url_options = { host: 'localhost:3000' }
  config.action_mailer.smtp_settings = {
    address: 'smtp.serviciodecorreo.es',
    port: '587',
    enable_starttls_auto: true,
    user_name: 'hola@infusionvlc.com',
    password: ENV['EMAIL_PASS'],
    authentication: 'plain'
  }

  config.paperclip_defaults = {
    storage: :s3,
    :path => "/file/:id/:filename",
    s3_credentials: {
      bucket: ENV['INFUSION_S3_BUCKET_DEV'],
      access_key_id: ENV['INFUSION_S3_ID'],
      secret_access_key: ENV['INFUSION_S3_SECRET'],
      s3_region: ENV['INFUSION_S3_REGION'],
      s3_host_name: ENV['INFUSION_S3_HOST']
    }
}
end
