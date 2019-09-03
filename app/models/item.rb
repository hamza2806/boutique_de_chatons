class Item < ApplicationRecord
	has_many :join_cart_items
	has_many :carts, through: :join_cart_items
	has_many :join_order_items
	has_many :orders, through: :join_order_items
	validates :title, :description, :price, :image_url, presence: true;
	validates :title, length: { maximum: 15};
	validates :description, length: { maximum: 150};
	validates :price, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }, :numericality => {:greater_than => 0, :less_than => 100}
	def price_not_nill
		if price.nil? || price < 0.01 || price > 99.99
  		errors.add(:price, "should be at least 0.01")
  		end 
    end

    validate :price_not_nill 
end