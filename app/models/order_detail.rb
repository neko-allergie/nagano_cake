class OrderDetail < ApplicationRecord
  belong_to :order
  belong_to :item


end
