if Rails.env.development? || Rails.env.production?
  Devise::Mailer.delivery_method = :smtp
  Devise::Mailer.smtp_settings = {
    address:          'smtp.sendgrid.net',
    port:             '2525',
    authentication:   'plain',
    user_name:        ENV['SENDGRID_USERNAME'],
    password:         ENV['SENDGRID_PASSWORD'],
    domain:           'heroku.com',
    enable_starttls_auto: true
  }
end
