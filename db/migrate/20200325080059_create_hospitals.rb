class CreateHospitals < ActiveRecord::Migration[6.0]
  def change
    create_table :hospitals do |t|
      t.text :name
      t.text :address
      t.string :type 
      t.integer :contact_number
      t.text :website
      t.timestamps
    end
  end
end
