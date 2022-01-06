class ApplicationController < ActionController::Base
  before_action :configure_parmitted_parameters, if: :devise_controller?

  private
  def configure_parmitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :dob, :last_name, :first_name, :ruby_last_name, :ruby_first_name])
  end
end
