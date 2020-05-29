class ChangeColumnToEndUser < ActiveRecord::Migration[5.2]
  def up
    change_column :end_users, :is_unsubscribed, :boolean, null: false , default: false
  end

  def down
    change_column :end_users, :is_unsubscribed, :boolean, null: false
  end
end
