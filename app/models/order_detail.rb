class OrderDetail < ApplicationRecord
  belongs_to :order
  belongs_to :item

  #enumで注文ステータスを管理
  enum making_status: { "着手不可": 0 ,"制作待ち": 1 ,"制作中": 2,"制作完了": 3}


end
