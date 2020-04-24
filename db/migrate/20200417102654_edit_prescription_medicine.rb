class EditPrescriptionMedicine < ActiveRecord::Migration[6.0]
def down 
  remove_column :prescription_medicines, :prescriptions_id  
end

def up
  add_reference :prescription_medicines, :prescription
end  
end
