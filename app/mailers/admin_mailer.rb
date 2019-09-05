class AdminMailer < ApplicationMailer
  
  def info_order(joinorderitem)
  
    @JoinOrderItem = joinorderitem
  
   
    mail(to: @JoinOrderItem.item.admin.email, subject:'Une commande a été passée!')
  
end
end
