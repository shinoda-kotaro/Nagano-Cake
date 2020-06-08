class Admins::EndUsersController < Admins::Base
  def index
    @end_users = EndUser.all
  end
  
end
