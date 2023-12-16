class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def root
    if current_user.present?
      redirect_to user_path
    else
      redirect_to home_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:student, personal_information_attributes: [:first_name, :last_name, :phone_number]])
  end
end
