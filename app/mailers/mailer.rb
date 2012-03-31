class Mailer < ActionMailer::Base
  def recovery(options)
    from "Simple and Restful Account Recovery <name@domain.com>"
    recipients options[:email_address]
    subject "Simple and Restful Account Recovery"
    content_type 'text/html'
    
    body :to => :to_user,:key => options[:key], :domain => options[:domain]
  end
end
