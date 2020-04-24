class AddReferencePresecriptionMedicines < ActiveRecord::Migration[6.0]
  def change
    add_reference :prescription_medicines, :prescriptions
  end
end
