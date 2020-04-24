class DropProductsTable < ActiveRecord::Migration[6.0]
  def change
    drop_table :Prescriptions
  end
end
