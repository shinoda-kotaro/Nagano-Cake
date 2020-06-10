class ChangeColumnToItem2 < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :is_sale, :boolean, null: false
  end
  def down
    change_column :items, :is_sale, :boolean, null: true
  end
end
