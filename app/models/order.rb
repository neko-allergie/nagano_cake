class Order < ApplicationRecord
  has_many :order_details, dependent: :destroy
  belongs_to :customer, optional: true


  #enumで支払い方法を管理
  enum pay_method: { credit_card: 0 , transfer: 1 }

  #enumで注文ステータスを管理
  enum status: { payment_waiting: 0 , payment_confirmation: 1 , in_production: 2, preparing_delivery: 3, delivered: 4}

  #郵便番号のバリデーション、7桁以外の数字は弾く正規表現
  VALID_POSTCODE_REGEX = /\A\d{7}\z/

  #バリテーション一括設定(空では保存できない)
  with_options presence: true do
    #validates :customer_id
    validates :address
    validates :pay_method
    validates :status
    #validates :postage
    validates :postcode, format: { with: VALID_POSTCODE_REGEX }
    validates :name
    #validates :charge
  end

  # 商品合計金額
  def sum_price
    charge - postage
  end

end
