class Customer < ApplicationRecord
  def name
    [first_name, last_name].join(' ')
  end
  has_many :addresses
end
