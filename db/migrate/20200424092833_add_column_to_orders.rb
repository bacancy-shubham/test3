class AddColumnToOrders < ActiveRecord::Migration[6.0]
  def change
    add_column :orders, :medicine, :string
  end
end
