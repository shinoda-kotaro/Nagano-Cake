class ChangeColumnToOrder5 < ActiveRecord::Migration[5.2]
  def up
    change_column :orders , :address , :string , null: false
  end
  def down
    change_column :orders , :address , :string
  end
end
