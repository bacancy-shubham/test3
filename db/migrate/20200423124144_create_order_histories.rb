class CreateOrderHistories < ActiveRecord::Migration[6.0]
  def change
    create_table :order_histories do |t|
      t.integer :user_id
      t.integer :medical_store_id
      t.integer :quantity
      t.string :name
      t.integer :price
      t.integer :total
      t.boolean :status, default: 0
      t.timestamps
    end
  end
end
