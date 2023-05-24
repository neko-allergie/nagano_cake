class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :deli_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  #郵便番号のバリデーション、7桁以外の数字は弾く正規表現
  VALID_POSTCODE_REGEX = /\A\d{7}\z/

  #電話番号のバリデーション、11桁以外の数字は弾く正規表現
  VALID_PHONE_NUMBER_REGEX = /\A\d{11}\z/

  # 空では保存できないバリテーション一括設定
  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_kana
    validates :first_kana
    validates :postcode, format: { with: VALID_POSTCODE_REGEX }
    validates :address
    validates :phone_number, format: {with: VALID_PHONE_NUMBER_REGEX }
    validates :email
  end

  # フルネーム表示
  def full_name
    self.last_name + " " + self.first_name
  end
  # フルネーム カナ表示
  def full_name_kana
    self.last_kana + " " + self.first_kana
  end


end
