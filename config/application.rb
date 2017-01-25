require_relative 'boot'

require 'rails/all'

puts __FILE__

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

#TODO change 'App' to decent application name
module App
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    WillPaginate.per_page = 5

    # mailer
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.smtp_settings = {
      :authentication => :plain,
      :address => "smtp.mailgun.org",
      :port => 587,
      :domain => ENV["MAILGUN_DOMAIN"], 
      :user_name => ENV["MAILGUN_USERNAME"],
      :password => ENV["MAILGUN_PASSWORD"]
    }

    #destination = "#{Rails.root}/app/views/layouts/_navbar.html.erb"
    #tableName = ""
    #content = "<li><a href='" + tableName + "'>" + tableName + "</a></li>"

    #open(destination, 'a') do |f|
    #      f << "\n" + content 
  end

end

