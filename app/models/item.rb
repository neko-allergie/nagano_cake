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

  def taxin_order_price
    (self.without_tax * 1.1).round
  end

  def get_item_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/naganocake.png')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height], gravity: "center" ,crop: "125x125+0+0" ).processed
  end


  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "genre_id", "id", "introduction", "name", "sale_status", "updated_at", "without_tax"]
  end
end