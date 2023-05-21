class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :cart_items, dependent: :destroy

  # 殻では保存できないバリテーション一括設定
  with_options presence: true do
    validates :last_name
    validates :first_name
    validates :last_kana
    validates :first_kana
    validates :postcode
    validates :address
    validates :phone_number
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
