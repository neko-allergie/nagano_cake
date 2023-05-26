class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item
  

  #enumで制作ステータスを管理
  enum making_status: { production_not_possible: 0 , production_pending: 1 , in_production: 2, production_complete: 3}

  #小計
  def item_sum
    item.taxin_order_price * quantity
  end

end
