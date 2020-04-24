class MedicineStocksController < ApplicationController
    before_action :authenticate_user!
  def new
    @medicine = MedicineStock.new
  end

  def create
    @medicine = MedicineStock.new(medicine_params)
    binding.pry 
    @medicine.medical_store_id = current_user.medical_store.id
    if @medicine.save
      redirect_to medicine_stocks_path
    else
      render :new
    end
  end

  def edit
    @medicine = MedicineStock.find(params[:id])
  end

  def update
    @medicine = MedicineStock.find(params[:id])
      if @medicine.update(medicine_params)
        redirect_to medicine_stocks_path
      else
        render :edit
      end
  end

  def destroy
    @medicine = MedicineStock.find(params[:id])
    if @medicine.destroy
      redirect_to medicine_stocks_path
    end
  end

  def index
    @medicines =MedicineStock.all.where(medical_store_id: current_user.medical_store.id)
  end

  def medicine_params
     params.require(:medicine_stock).permit(:name, :price, :quantity)
  end
end
