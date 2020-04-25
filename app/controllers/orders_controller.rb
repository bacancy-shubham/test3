class OrdersController < ApplicationController

  def index
    @orders = MedicalStore.find_by(user:current_user)&.orders
  end
 
end
