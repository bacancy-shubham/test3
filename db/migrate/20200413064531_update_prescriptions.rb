class UpdatePrescriptions < ActiveRecord::Migration[6.0]
  def change
    remove_column :prescriptions, :medicine
    remove_column :prescriptions, :quantity
    add_column :prescriptions, :disease, :string
  end
end
