class AdminMailer < ApplicationMailer

    def info_order(admin_email, order)
        @order = order
        mail(to: admin_email, subject:'Une commande a été passée!')
      end

end
