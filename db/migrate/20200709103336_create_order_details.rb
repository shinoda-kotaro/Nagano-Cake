class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|

      t.integer :item_id , null: false
      t.references :order
      t.integer :price , null: false
      t.integer :production_status , null: false , default: 0
      t.integer :amount , null: false
      t.timestamps
    end
    add_foreign_key :order_details, :orders
  end
end
