class ApplicationController < ActionController::Base

	before_action :configure_sign_up_params,if: :devise_controller?


	protected
	def configure_sign_up_params
     devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :age, :gender])
   end

   def configure_account_update_params
     devise_parameter_sanitizer.permit(:account_update, keys: [:name, :age, :gender])
   end

   private

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_temples_path
    else
      user_temples_path
    end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      new_admin_session_path
    else
      new_user_session_path
    end
  end


end
