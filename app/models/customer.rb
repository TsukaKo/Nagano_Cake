class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

    def name
      [first_name, last_name].join(' ')
    end
  has_many :addresses
  has_many :cart_items
  enum is_active_method: { "有効": true, "退会": false }


  def active_for_authentication?
    super && (self.is_active != false)
  end

end
