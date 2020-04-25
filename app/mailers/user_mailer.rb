class UserMailer < ApplicationMailer
  
  def order(order)
    @greeting = 'Your Order <%= order.medicine_stock.name %> rejected by <%= order.medical_store.name %> .'
    @order = order
    mail to: order.patient.user.email, subject: 'Order rejected.'
  end
end
