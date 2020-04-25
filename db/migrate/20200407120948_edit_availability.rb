class EditAvailability < ActiveRecord::Migration[6.0]
  def change
    remove_column :availabilities, :pathology_lab_id
    remove_column :availabilities, :day, :time
    remove_column :availabilities, :available_from, :time
    remove_column :availabilities, :available_to, :time
    add_column :availabilities, :available_from_1, :time
    add_column :availabilities, :available_from_2, :time
    add_column :availabilities, :available_from_3, :time
    add_column :availabilities, :available_from_4, :time
    add_column :availabilities, :available_from_5, :time
    add_column :availabilities, :available_from_6, :time
    add_column :availabilities, :available_from_7, :time
    add_column :availabilities, :available_to_1, :time
    add_column :availabilities, :available_to_2, :time
    add_column :availabilities, :available_to_3, :time
    add_column :availabilities, :available_to_4, :time
    add_column :availabilities, :available_to_5, :time
    add_column :availabilities, :available_to_6, :time
    add_column :availabilities, :available_to_7, :time
  end
end
