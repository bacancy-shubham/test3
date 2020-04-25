module OrdersHelper

  def medicine_stock(order)
    MedicineStock.exists?(name:order.medicine)
  end

  def find_by_name(order)
    MedicineStock.find_by(name:order.medicine)
  end
end
