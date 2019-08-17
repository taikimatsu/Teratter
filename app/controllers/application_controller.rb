class ApplicationController < ActionController::Base

	before_action :configure_sign_up_params,if: :devise_controller?

	def after_sign_in_path_for(resource)
  		user_temples_path
	end

	def after_sign_out_path_for(resource)
  		new_user_session_path
	end

	protected
	def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :gender])
   end

   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :gender])
   end
end
