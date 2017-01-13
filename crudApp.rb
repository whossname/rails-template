# GEMS
gem "bootstrap-generators", "~> 3.3.4"  # bootstrap page layout
gem "record_tag_helper", "~> 1.0"       # active records
gem "will_paginate", "~> 3.1.0"         # pagination
gem "will_paginate-bootstrap"
gem "sunspot_rails"                     # search
gem "sunspot_solr" 
gem "exception_notification"            # exceptions
gem "devise"                            # authentication
gem "devise-bootstrap-views"  


# INSTALL
run "bundle install"
generate "sunspot_rails:install"
generate "bootstrap:install"
generate "devise:install"

# generate database
rake "db:create", env: "development", sudo:true

model_name = "user" 
generate "devise", model_name

# default files

def source_paths
      [File.expand_path(File.dirname(__FILE__))]
end

paths = [
    #
    # app files
    "app/helpers/application_helper.rb",
    "config/application.rb",
    "config/crudApp.rb",
    #
    # layouts
    "app/assets/stylesheets/application.css",
    "app/views/layouts/application.html.erb",
    "app/views/layouts/_navbar.html.erb",
    #
    # templates
    "lib/templates/active_record/model/model.rb",
    "lib/templates/rails/scaffold_controller/controller.rb",
    "lib/templates/erb/controller/view.html.erb",
    "lib/templates/erb/scaffold/edit.html.erb",
    "lib/templates/erb/scaffold/index.html.erb",
    "lib/templates/erb/scaffold/show.html.erb",
    "lib/templates/erb/scaffold/_form.html.erb",
    "lib/templates/erb/scaffold/new.html.erb",
    #
    # user list
    "app/models/user.rb",
    "app/views/users/index.html.erb",
    "app/controllers/users_controller.rb",
    #
    # home page
    "app/controllers/home_controller.rb",
    "app/views/home/index.html.erb",
]

paths.each do |path|
    copy_file path, path 
end


# devise views (added here as they may need some css)
generate "devise:views:bootstrap_templates"
