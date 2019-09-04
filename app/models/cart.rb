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
  self.items.all.each do |item |
      total_price = total_price + item.price
    end
  return total_price
  end

  def add_item(cart_id, item_id)
    puts '***********************'
    puts cart_id
    puts '******************'
    current_cart_item = join_cart_items.find_by(item_id: item_id, cart_id: cart_id)
    if current_cart_item
    else
      additional_item = join_cart_items.create(item_id: item_id, cart_id: cart_id)
    end
  end

end