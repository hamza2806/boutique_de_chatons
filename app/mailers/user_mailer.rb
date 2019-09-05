class UserMailer < ApplicationMailer
    default from: 'roman.c6lle@gmail.com'

    def order_new_email(order)

        @order = order

        @url = 'https://cat-market-mpl.herokuapp.com/items'

        mail(to: @order.user.email, subject: 'Nouvelle commande !')
    end
end
