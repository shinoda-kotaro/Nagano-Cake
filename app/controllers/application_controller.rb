class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_admin
      admins_root_path
    elsif current_end_user
      end_users_mypage_path(current_end_user)
    else
      
    end
  end

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name , :under_name , :kana_first_name , :kana_under_name , :postcode , :address , :phone_number , :email, :password , :password_confirmation ])
  end
end
