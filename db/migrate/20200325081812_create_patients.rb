class CreatePatients < ActiveRecord::Migration[6.0]
  def change
    create_table :patients do |t|
      t.text :name
      t.date :birthday
      t.integer :gender
      t.integer :contact_number
      t.text :city
      t.references :users_roles, null: false, foreign_key: true
      t.timestamps
    end
  end
end
