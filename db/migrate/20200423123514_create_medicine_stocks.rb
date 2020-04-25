class CreateMedicineStocks < ActiveRecord::Migration[6.0]
  def change
    create_table :medicine_stocks do |t|
      t.text :name
      t.integer :quantity
      t.integer :medical_store_id
      t.integer :price
      t.timestamps
    end
  end
end
