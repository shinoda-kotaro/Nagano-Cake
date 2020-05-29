class RenameEndUserStatusColumnToEndUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :end_users, :end_user_status, :is_unsubscribed
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
