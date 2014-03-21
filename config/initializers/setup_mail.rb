if Rails.env.development?
  ActionMailer::Base.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address:        'smtp.sendgrid.net',
    port:           '587',
    authentication: :plain,
    user_name:      "app23220504@heroku.com", # SendGrid 
    password:       "9utui2i5",               # SendGrid
    domain:         'heroku.com',
    enable_starttls_auto: true
  }
end