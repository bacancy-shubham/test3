class ChangeToAppoiment < ActiveRecord::Migration[6.0]
  def change
    change_column :appoiments, :timing, :string
  end
end
