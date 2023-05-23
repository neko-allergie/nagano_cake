class CartItem < ApplicationRecord
  belongs_to :customer
  belongs_to :item
  
  def sum_of_order_price
    item.taxin_order_price * quantity
  end
end
