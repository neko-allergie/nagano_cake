class AddFirstKanaToCustomers < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :first_kana, :string
  end
end
