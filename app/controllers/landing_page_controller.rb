class LandingPageController < ApplicationController
  skip_before_action :authenticate_user!
  def home
    @no_default_navbar = true
  end
end
