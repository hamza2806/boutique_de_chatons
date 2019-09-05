class JoinOrderItem < ApplicationRecord
	belongs_to :item 
	belongs_to :order

	after_create :confirmation_send

    def confirmation_send
        AdminMailer.info_order(self).deliver_now
    end
end
