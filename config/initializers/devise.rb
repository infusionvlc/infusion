Devise.setup do |config|

  config.mailer_sender = 'hola@infusionvlc.com'

  config.parent_mailer = 'ActionMailer::Base'

  require 'devise/orm/active_record'

  config.authentication_keys = [ :login ]

  config.case_insensitive_keys = [:email]

  config.strip_whitespace_keys = [:email]

  config.skip_session_storage = [:http_auth]

  config.stretches = Rails.env.test? ? 1 : 11

  config.reconfirmable = true

  config.expire_all_remember_me_on_sign_out = true

  config.password_length = 6..128

  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/

  config.reset_password_within = 6.hours

  config.sign_out_via = :delete

  config.omniauth :github, ENV['INFUSION_GH_ID'], ENV['INFUSION_GH_SECRET'], scope: 'user:email'
  config.omniauth :twitter,  ENV['INFUSION_TW_ID'], ENV['INFUSION_TW_SECRET']
  config.omniauth :google_oauth2,  ENV['INFUSION_G_ID'], ENV['INFUSION_G_SECRET']
end
