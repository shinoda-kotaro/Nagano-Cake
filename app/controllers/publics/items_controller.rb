class Publics::ItemsController < Publics::Base
  before_action :subscribed
  before_action :authenticate_end_user! , except: [:top]

  def top

  end

  def index

  end

  def show
    
  end

  private

  def subscribed
    if end_user_signed_in?
      unless current_end_user.is_unsubscribed?
        redirect_to end_users_logout_path
      end
    end
  end
end
