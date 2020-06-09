class CreateGenres < ActiveRecord::Migration[5.2]
  def change
    create_table :genres do |t|
      t.string :name , null: false , unique: true
      t.boolean :is_effective , null: false , default: false
      t.timestamps
    end
  end
end
