class MedicalStoresController < ApplicationController
    before_action :authenticate_user!, except: [:login, :create]

  def login
    @user = User.new
    @medical_store = MedicalStore.new
  end

  def create
  @user = User.new(store_params)
    if @user.save
      @user.add_role :store
      redirect_to new_user_session_path
    else
      render :login
    end
  end 

  def stock
    @stock = MedicineStock.find(params[:id])
    quantity = @stock.quantity
    updated_quantity = quantity - params[:orderQuantity].to_i
    @stock.update(quantity: updated_quantity)
    order_history(@stock,params[:patientId], params[:orderQuantity].to_i)
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

  def store_params
    params.require(:user).permit(:email, :password, :password_confirmation, medical_store_attributes: [:name, :city, :contact_number])
  end
  
end
