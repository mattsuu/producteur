# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!


# 下記の2行は、 rails g devise:installをした時の指示？を一応書いているもの
# config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

# In production, :host should be set to the actual host of your application.