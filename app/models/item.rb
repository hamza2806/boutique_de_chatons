class Item < ApplicationRecord
	validates :title, :description, :price, :image_url, presence: true;
	validates :title, length: { maximum: 15};
	validates :description, length: { maximum: 150};
	def price_not_nill
		if price.nil? || price < 0.01
  		errors.add(:price, "should be at least 0.01")
  		end 
    end

    validate :price_not_nill 
end
