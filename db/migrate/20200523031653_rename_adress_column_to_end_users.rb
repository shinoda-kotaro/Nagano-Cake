class RenameAdressColumnToEndUsers < ActiveRecord::Migration[5.2]
  def change
    rename_column :end_users, :adress, :address
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
