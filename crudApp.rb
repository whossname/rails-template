# GEMS
gem "bootstrap-generators", "~> 3.3.4"  # bootstrap page layout
gem "record_tag_helper", "~> 1.0"       # active records
gem "will_paginate", "~> 3.1.0"         # pagination
gem "will_paginate-bootstrap"
gem "sunspot_rails"                     # search
gem "sunspot_solr" 
gem "exception_notification"            # exceptions
gem "devise"                            # authentication


# INSTALL
run "bundle install"
generate "sunspot_rails:install"
generate "bootstrap:install"
generate "devise:install"

# generate database
rake "db:create", env: "development", sudo:true

model_name = "user" 
generate "devise", model_name


# add templates and application files

def source_paths
      [File.expand_path(File.dirname(__FILE__))]
end

copy_file "appFiles/css/application.css", "app/assets/stylesheets/application.css"
copy_file "appFiles/helpers/application_helper.rb", "app/helpers/application_helper.rb"
copy_file "appFiles/config/application.rb", "config/application.rb"
copy_file "appFiles/layouts/application.html.erb", "app/views/layouts/application.html.erb"
copy_file "appFiles/layouts/_navbar.html.erb", "app/views/layouts/_navbar.html.erb"

# set home page
copy_file "appFiles/config/routes.rb", "config/routes.rb"
copy_file "appFiles/controllers/home_controller.rb", "app/controllers/home_controller.rb"
copy_file "appFiles/views/home/index.html.erb", "app/views/home/index.html.erb"

# TEMPLATES
paths = [
    "templates/active_record/model/model.rb",
    "templates/rails/scaffold_controller/controller.rb",
    "templates/erb/controller/view.html.erb",
    "templates/erb/scaffold/edit.html.erb",
    "templates/erb/scaffold/index.html.erb",
    "templates/erb/scaffold/show.html.erb",
    "templates/erb/scaffold/_form.html.erb",
    "templates/erb/scaffold/new.html.erb"
]

paths.each do |path|
    copy_file path, "lib/" + path 
end


# append file using:
## echo "hello world" >> my_file.txt

