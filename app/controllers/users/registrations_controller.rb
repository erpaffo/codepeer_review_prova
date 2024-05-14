class Users::RegistrationsController < Devise::RegistrationsController
  # GET /resource/sign_up
  def new
    build_resource(sign_up_params)
    resource.email = params[:email] if params[:email]
    respond_with resource
  end

  # POST /resource
  def create
    super
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
  end

  private

  def sign_up_params
    devise_parameter_sanitizer.sanitize(:sign_up)
  end
end
