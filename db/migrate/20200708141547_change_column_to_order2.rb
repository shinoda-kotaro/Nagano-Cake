class ChangeColumnToOrder2 < ActiveRecord::Migration[5.2]
  def up
    change_column :orders , :order_status , :integer , null: false , default: "0"
  end
  def down
    change_column :orders , :order_status , :integer , null: false
  end
end
