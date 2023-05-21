class Item < ApplicationRecord
  has_many :cart_items, dependent: :destroy
  has_many :order_details, dependent: :destroy
  belongs_to :genre

  has_one_attached :image

  #enumで販売ステータスを管理,販売中は0、売り切れは1
  enum sale_status: { on_sale: 0 , sold: 1 }

  validates :genre, presence: true
  validates :name, presence: true
  validates :introduction, presence: true
  validates :without_tax, presence: true

  scope :price_high_to_low, -> { order(price: :desc) }
  scope :price_low_to_high, -> { order(price: :asc) }

end
