class CreateAvailabilities < ActiveRecord::Migration[6.0]
  def change
    create_table :availabilities do |t|
      t.text :day
      t.time :available_from
      t.time :available_to
      t.references :doctor, null: false, foreign_key: true
      t.references :pathology_lab, null: false, foreign_key: true

      t.timestamps
    end
  end
end
