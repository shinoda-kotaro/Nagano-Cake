class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.integer :genre_id , null: false
      t.integer :price , null: false
      t.boolean :is_sale , null: false , default: false
      t.string :image_id , null: false
      t.string :name , null: false
      t.text :description , null: false
      t.timestamps
    end
    add_index :items, :name
  end
end
