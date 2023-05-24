class Order < ApplicationRecord
  has_many :order_detials, dependent: :destroy
  belongs_to :customer


  #enumで支払い方法を管理
  enum pay_method: { credit_card: 0 , transfer: 1 }

  #enumで注文ステータスを管理
  enum status: { "入金待ち": 0 ,"入金確認": 1 ,"製作中": 2,"発送準備中": 3,"発送済み": 4}

  #郵便番号のバリデーション、7桁以外の数字は弾く正規表現
  VALID_POSTCODE_REGEX = /\A\d{7}\z/

  #バリテーション一括設定(空では保存できない)
  with_options presence: true do
    validates :customer_id
    validates :address
    validates :pay_method
    validates :status
    validates :postage
    validates :postcode, format: { with: VALID_POSTCODE_REGEX }
    validates :name
    validates :charge
  end

end
