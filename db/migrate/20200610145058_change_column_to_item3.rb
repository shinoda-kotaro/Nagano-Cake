class ChangeColumnToItem3 < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :image_id, :boolean, null: true
  end
  def down
    change_column :items, :image_id, :boolean, null: false
  end
end
