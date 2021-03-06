class CreateNewPrescription < ActiveRecord::Migration[6.0]
  def change
    create_table :prescriptions do |t|
      t.text :medicine
      t.integer :quantity
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
