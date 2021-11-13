class CartItem < ApplicationRecord
  belongs_to :item
  belongs_to :customer
  belongs_to :order
  def subtotal
    item.price * amount
  end
end
