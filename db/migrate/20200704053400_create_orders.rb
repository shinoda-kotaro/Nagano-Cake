class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :end_user_id ,null: false
      t.integer :postage ,null: false
      t.integer :payment_status ,null: false
      t.integer :order_status ,null: false
      t.string :postcode ,null: false
      t.string :name ,null: false
      t.integer :total_price ,null: false
      t.timestamps
    end
  end
end
