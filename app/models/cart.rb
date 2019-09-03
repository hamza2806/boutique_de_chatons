class Cart < ApplicationRecord
  belongs_to :user
  has_many :join_cart_items
  has_many :items, through: :join_cart_items

  def is_cart_empty
    if self.items.count == 0
      return true
    else
      return false
    end
  end

end
