class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if current_admin
      admin_root_path
    elsif current_end_user
      root_path
    else
      
    end
  end
end
