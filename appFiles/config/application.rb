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


      #destination = "#{Rails.root}/app/views/layouts/_navbar.html.erb"
      #tableName = ""
      #content = "<li><a href='" + tableName + "'>" + tableName + "</a></li>"

      #open(destination, 'a') do |f|
      #      f << "\n" + content 
  end

end

