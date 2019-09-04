class AddQuantityToJoinCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :join_cart_items, :quantity, :integer, default: 1
  end
end
