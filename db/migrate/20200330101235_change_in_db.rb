class ChangeInDb < ActiveRecord::Migration[6.0]
  def change
    remove_column :doctors, :user_id
    add_reference :doctors, :user
    remove_column :hospitals, :type
    remove_column :medical_stores, :user_id
    add_reference :medical_stores, :user
    add_column :messages, :status, :boolean
    add_column :notifications, :status, :boolean
    remove_column :pathology_labs, :user_id
    add_reference :pathology_labs, :user
    remove_column :patients, :users_roles_id
    add_reference :patients, :user
  end
end
