class Address < ApplicationRecord
  belongs_to :customer
  has_many :orders

  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end

end
