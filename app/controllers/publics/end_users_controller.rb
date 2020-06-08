class Publics::EndUsersController < Publics::Base

  def show
    @end_user = EndUser.find(current_end_user.id)
  end

  def edit
    @end_user = EndUser.find(current_end_user.id)
  end
  
  def check
    @end_user = EndUser.find(current_end_user.id)
  end
  
end
