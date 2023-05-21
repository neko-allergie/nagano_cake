class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.integer :customer_id,null: false, foreign_key: true
      t.string :address,null: false
      t.integer :pay_method,null: false
      t.integer :status,null: false
      t.integer :postage,null: false
      t.string :postcode,null: false
      t.string :name,null: false
      t.integer :charge,null: false
      t.timestamps
    end
  end
end
