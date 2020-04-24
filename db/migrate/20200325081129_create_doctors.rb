class CreateDoctors < ActiveRecord::Migration[6.0]
  def change
    create_table :doctors do |t|
      t.text :name
      t.text :degrees
      t.text :specialization
      t.boolean :authorized
      t.references :hospital, null: false
      t.integer :user_id
      t.timestamps
    end
  end
end
