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

  def total_price
    total_price = 0
    self.items.all.each do |item|
      total_price = total_price + item.price
    end
    return total_price
  end

end
