class Accounts::SessionsController < Devise::SessionsController
  layout false
  # before_action :configure_sign_in_params, only: [:create]
  skip_before_filter :verify_authenticity_token, :only => [:create]
  before_action :require_no_sso!, only: [:new, :create]
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #     super
  # end

  
  def create
    resource = warden.authenticate!(scope: resource_name, recall: "#{controller_path}#new")
    set_flash_message(:notice, :signed_in) if is_navigational_format?
    sign_in(resource_name, resource)
    respond_to do |format|
      format.html { redirect_back_or_default(root_url) }
      format.json { render status: '201', json: resource.as_json(only: [:login, :email]) }
    end
  end
  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
