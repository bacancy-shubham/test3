class CreatePathologyLabs < ActiveRecord::Migration[6.0]
  def change
    create_table :pathology_labs do |t|
      t.text :name
      t.text :address
      t.boolean :authorized
      t.integer :user_id
      t.integer :contact_number
      t.timestamps
    end
  end
end
