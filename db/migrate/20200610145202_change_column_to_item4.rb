class ChangeColumnToItem4 < ActiveRecord::Migration[5.2]
  def up
    change_column :items, :image_id, :string
  end
  def down
    change_column :items, :image_id, :string
  end
end
