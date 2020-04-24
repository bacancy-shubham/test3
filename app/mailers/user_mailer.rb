class UserMailer < ApplicationMailer
  
  def order(order)
    @greeting = 'Your Order <%= order.medicine_stock.name %> rejected by <%= order.medical_store.name %> .'
end
