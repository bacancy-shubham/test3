class DocotrAuthorizedModif < ActiveRecord::Migration[6.0]
  def change
    remove_column :doctors, :authorized
    add_column :doctors, :authorized, :boolean, default: false
  end
end
