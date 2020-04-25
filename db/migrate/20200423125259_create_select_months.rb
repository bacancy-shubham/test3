class CreateSelectMonths < ActiveRecord::Migration[6.0]
  def change
    create_table :select_months do |t|
       t.date :starting_date
      t.date :ending_date
      t.time :starting_time
      t.time :ending_time
      t.integer :doctor_id
      t.timestamps
    end
  end
end
