# Load the rails application
require File.expand_path('../application', __FILE__)

ActionMailer::Base.smtp_settings = {
  :address => "smtp.gmail.com",
  :port => 587,
  :domain => "domain.com",
  :authentication => :plain,
  :user_name => "agathe.begault@gmail.com",
  :password => "VXSZPNOA45"
}

# Initialize the rails application
Tracker::Application.initialize!
