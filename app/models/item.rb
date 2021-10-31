class Item < ApplicationRecord
  attachment :image
  belongs_to :genre
  enum is_active_method: { "販売中": true, "販売停止中": false }
end
