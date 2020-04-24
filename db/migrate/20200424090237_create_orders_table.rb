class CreateOrdersTable < ActiveRecord::Migration[6.0]
  def change
      create_table :orders do |t|
        t.integer :medicine_stock_id
        t.integer :quantity
        t.integer :patient_id
        t.integer :medical_store_id
        t.timestamps
      end
  end
end
