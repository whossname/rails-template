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

# append file using:
## echo "hello world" >> my_file.txt

# add templates and application files

def source_paths
      [File.expand_path(File.dirname(__FILE__))]
end

copy_file "appFiles/css/application.css", "app/assets/stylesheets/application.css"
copy_file "appFiles/helpers/application_helper.rb", "app/helpers/application_helper.rb"
copy_file "appFiles/config/application.rb", "config/application.rb"
FileUtils.cp_r "/templates", "lib"

