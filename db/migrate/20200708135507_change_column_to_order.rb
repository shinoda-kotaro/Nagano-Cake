class ChangeColumnToOrder < ActiveRecord::Migration[5.2]
  def up
    change_column :orders , :payment_status , :integer , null: false , default: "0"
  end
  def down
    change_column :orders , :payment_status , :integer , null: false
  end
end
