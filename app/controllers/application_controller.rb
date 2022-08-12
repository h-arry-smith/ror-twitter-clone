class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :authenticate_user!

  protected

  def set_current_user
    @user = current_user
  end

  def set_user_from_handle
    @user = User.find_by(handle: params[:handle])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:handle])
  end
end
