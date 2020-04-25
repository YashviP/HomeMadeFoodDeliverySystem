# Load the Rails application.
require_relative 'application'

#Rails.application.config.hosts << "03202667.ngrok.io"
# Initialize the Rails application.

Rails.application.initialize!
ENV["SMARTY_STREETS_AUTH_ID"] = "5be73f10-912f-e931-6aac-5af4f8a3bccb"
ENV["SMARTY_STREETS_AUTH_TOKEN"] = "Yb1AtL1VFUVIj4C6AKm2"
#.application.config.hosts << "http://f92dcfb6.ngrok.io"