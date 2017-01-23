class HomeController < ApplicationController
  skip_before_filer :authenticate_user!
end
