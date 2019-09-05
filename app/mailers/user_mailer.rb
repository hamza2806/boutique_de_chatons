class UserMailer < ApplicationMailer
    default from: 'roman.c6lle@gmail.com'

    def order_new_email(order)

        @order = order

        @url = 'https://cat-market-mpl.herokuapp.com/items'

        mail(to: @order.user.email, subject: 'Nouvelle commande !')
    end

    def info_order(order)

        puts "£"*60
        puts "bonjour"
        puts "£"*60
  
        @order = order
      
        @order.items.all.each do |item|
          mail(to:item.admin.email, subject:'Une commande a été passée!')
          
        end
        
      
    end
end
