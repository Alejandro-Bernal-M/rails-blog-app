class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :update_allowed_parameters, if: :devise_controller?
  before_action :set_current_user
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  def set_current_user
    @current_user = current_user
  end

  protected

  def update_allowed_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:Name, :email, :password, :Photo, :Bio, :PostCounter) }
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:Name, :email, :password, :current_password, :Photo, :Bio, :PostCounter)
    end
  end
end
