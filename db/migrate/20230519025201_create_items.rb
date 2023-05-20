class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.integer :genre_id, null: false, foreign_key: true
      t.string :name, null: false
      t.string :introduction, null: false
      t.integer :without_tax, null: false
      t.integer :sale_status, null: false, default: 0
      t.timestamps
    end
  end
end
