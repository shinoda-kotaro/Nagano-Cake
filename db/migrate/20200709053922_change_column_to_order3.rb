class ChangeColumnToOrder3 < ActiveRecord::Migration[5.2]
  def up
    change_column :orders , :postage , :integer , null: false , default: 800
  end
  def down
    change_column :orders , :postage , :integer , null: false
  end
end
