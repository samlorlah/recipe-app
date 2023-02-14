class ApplicationController < ActionController::BaseS
  protect_from_forgery with: :exception

  before_action :update_allowed_parameters, if: :devise_controller?
  skip_before_action :verify_authenticity_token

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[name password])
    devise_parameter_sanitizer.permit(:account_update, keys: %i[name password current_password])
  end
end
