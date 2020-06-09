class ChangeColumnToGenre2 < ActiveRecord::Migration[5.2]
  def up
    change_column :genres, :is_effective, :boolean, null: false, default: ""
  end
  def down
    change_column :genres, :is_effective, :boolean, null: false, default: false
  end
end
