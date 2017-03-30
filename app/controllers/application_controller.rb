class ApplicationController < ActionController::Base
	before_action :authenticate_account!
	protect_from_forgery with: :exception
	before_action :configure_permitted_parameters, if: :devise_controller?
	add_breadcrumb "首页", :root_path

	def configure_permitted_parameters
		added_attrs = [:username, :password, :password_confirmation, :remember_me]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs
		devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
	end

	def redirect_back_or_default(default)
       redirect_to(session[:return_to] || default)
       session[:return_to] = nil
    end

    def redirect_referrer_or_default(default)
       redirect_to(request.referrer || default)
    end

    def store_location
      session[:return_to] = request.url
    end

    def authenticate_account!(opts = {})
	    return if current_account
	    
	    store_location
	    # binding.pry
	    # if Setting.sso_enabled?
	    #   redirect_to auth_sso_path and return
	    # end
	    # binding.pry
	    super(opts)
	end

	def require_no_sso!
	    redirect_to auth_sso_path if Setting.sso_enabled?
    end
end
