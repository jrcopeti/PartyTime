class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  # before_action :configure_permitted_parameters, if: :devise_controller?
  def default_url_options
    { host: ENV["DOMAIN"] || "localhost:3000" }
  end
end
