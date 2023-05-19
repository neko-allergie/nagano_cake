class AddLastKanaToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :last_kana, :string
  end
end
