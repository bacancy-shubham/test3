class CreateTablePrescriptionMedicines < ActiveRecord::Migration[6.0]
  def change
    create_table :prescription_medicines do |t|
      t.string :medicine
      t.integer :quantity
    end
  end
end
