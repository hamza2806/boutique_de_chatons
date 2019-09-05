class Order < ApplicationRecord

    belongs_to :user
    has_many :join_order_items
    has_many :items, through: :join_order_items

    
    #after_create :order_send


    def order_send
        UserMailer.order_new_email(self).deliver_now
    end
end
