class DeliAddress < ApplicationRecord
  belongs_to :customer
  
with_options presence: true do
  validates :postcode , length: { is: 7 }
  validates :name
  validates :address
end



  def address_display
    '〒' + postal_code + ' ' + address + ' ' + name
  end
end
