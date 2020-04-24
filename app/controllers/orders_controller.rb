class OrdersController < ApplicationController

  def index
    @orders = MedicalStore.find_by(user:current_user)&.orders
  end

  def stock
    @stock = MedicineStock.find(params[:id])
    quantity = @stock.quantity
    updated_quantity = quantity - params[:orderQuantity].to_i
    @stock.update(quantity: updated_quantity)
    order_history(@stock,params[:patientId], quantity)
    Order.delete(params[:orderId])
    render json: {
      data: 'true', status: 200
    }
  end
  
  def sendmail
    @order = Order.find(params[:orderId])
    UserMailer.order(@order).deliver_now
    Order.delete(params[:orderId])
  end
  
  def order_history(stock, patientId,quantity)
    total = (quantity) * (stock.price)
    OrderHistory.create(user_id: patientId, name: stock.name, price: stock.price, quantity:quantity, medical_store_id:current_user.medical_store.id,total: total)
  end
  
end
