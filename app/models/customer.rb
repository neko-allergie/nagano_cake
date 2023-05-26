class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy
  has_many :deli_addresses, dependent: :destroy
  has_many :orders, dependent: :destroy

  # 空では保存できないバリテーション一括設定
  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_kana
    validates :first_kana
    validates :postcode, length: { is: 7 }
    validates :address
    validates :phone_number,    length: { in: 10..11 }
  end
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }

  # フルネーム表示
  def full_name
    self.last_name + " " + self.first_name
  end
  # フルネーム カナ表示
  def full_name_kana
    self.last_kana + " " + self.first_kana
  end


end
