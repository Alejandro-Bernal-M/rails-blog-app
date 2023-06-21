class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:Name, :email, :password, :Photo, :Bio, :PostCounter) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:Name, :email, :password, :current_password, :Photo, :Bio, :PostCounter)
    end
  end
end
