class Cart < ApplicationRecord
belongs_to :user
has_many :join_cart_items
has_many :items, through: :join_cart_items

#---------------------------------

  def is_cart_empty
    if self.items.count == 0
    return true
    else
    return false
    end
  end

#---------------------------------

  def total_price
  total_price = 0
  self.items.all.each do |item |
      total_price = total_price + item.price
    end
  return total_price
  end

#---------------------------------

  def add_item(cart_id, item_id)
    current_cart_item = join_cart_items.find_by(item_id: item_id, cart_id: cart_id)
    if current_cart_item
    else
      additional_item = join_cart_items.create(item_id: item_id, cart_id: cart_id)
    end
  end

#---------------------------------

  def delete_all_items
    # loop on each items of the cart, suppression of each couple of JoinCartItem
    self.items.all.each do |item|
      @cart_item = JoinCartItem.find_by(cart_id:self.id, item_id:item.id)
      @cart_item.destroy
    end
  end

#---------------------------------

  def delete_item(item_id)
    # suppress selected item from JoinCartItem
    @cart_item = JoinCartItem.find_by(cart_id:self.id, item_id:item_id)
    @cart_item.destroy
  end

#---------------------------------


end
