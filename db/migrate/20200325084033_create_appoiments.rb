class CreateAppoiments < ActiveRecord::Migration[6.0]
  def change
    create_table :appoiments do |t|
      t.date :date
      t.time :timing
      t.references :patient, null: false, foreign_key: true
      t.references :doctor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
