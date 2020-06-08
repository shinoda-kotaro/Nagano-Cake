class Publics::EndUsersController < Publics::Base
  before_action :subscribed
  before_action :authenticate_end_user!

  def show
    @end_user = EndUser.find(current_end_user.id)
  end

  def edit
    @end_user = EndUser.find(current_end_user.id)
  end
  
  def check
    @end_user = EndUser.find(current_end_user.id)
  end

  def withdrawal
    end_user = EndUser.find(current_end_user.id)
    if end_user.update(end_user_params)
      redirect_to end_users_logout_path
    else
      redirect_to end_users_mypage_path
    end
  end

  private
  
  def end_user_params
    params.require(:end_user).permit(:is_unsubscribed)
  end
  
  def subscribed
    unless current_end_user.is_unsubscribed?
      redirect_to end_users_logout_path
    end
  end
  
end
