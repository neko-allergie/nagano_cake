class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|
      t.references :order, null: false, foreign_key: { to_table: :orders}
      t.references :item, null: false, foreign_key: { to_table: :items}
      t.integer :quantity,null: false
      t.integer :order_price,null: false
      t.integer :making_status,null: false,default: 0

      t.timestamps
    end
  end
end
