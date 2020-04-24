class CreateMedicalStores < ActiveRecord::Migration[6.0]
  def change
    create_table :medical_stores do |t|
      t.text :city
      t.text :name
      t.integer :contact_number
      t.integer :user_id
      t.timestamps
    end
  end
end
