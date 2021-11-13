class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  enum is_active_method: { "販売中": true, "販売停止中": false }
  has_many :cart_items
  def price_add_tax
    tax=1.1
    (self.price*tax).round
  end

end
