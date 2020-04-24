class ChargesController < ApplicationController
  def new
    @data = OrderHistory.where(user_id:current_user,status:false).sum(:total)
  end

  def create
    @amount = OrderHistory.where(user_id:current_user,status:false).sum(:total)
 
    # Amount in cents
    customer = Stripe::Customer.create({
      email: params[:stripeEmail],
      source: params[:stripeToken],
    })

    charge = Stripe::Charge.create({
      customer: customer.id,
      amount: @amount,
      description: 'Rails Stripe customer',
      currency: 'inr',
    })
    @order_histories = OrderHistory.where('user_id = ?',current_user.id)
    @order_histories.each do |order_history|
      order_history.update(status:1)
    end

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to new_charge_path
  end
end
