class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:username, :name, :category, :location, :photo]
    devise_parameter_sanitizer.for(:account_update) << [:username, :name, :category, :location, :photo]
  end

  def after_sign_in_path_for(resource)
  	stored_location_for(resource) ||
  		if resource.is_a?(User) && resource.category == "school"
  			proposals_path
  		elsif resource.is_a?(User) && resource.category == "volunteer"
  			schools_path
  		else
  			super
  		end
  	end
end
