class UpdateMessage < ActiveRecord::Migration[6.0]
  def change
    remove_column :messages, :doctor_id, :integer
    remove_column :messages, :patient_id, :integer
    add_column :messages, :sender_id, :integer
    add_column :messages, :receiver_id, :integer
    change_column :messages, :message, :string
  end
end
