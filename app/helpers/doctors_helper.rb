module DoctorsHelper
  def find_patient_name(patient_id)
    @patient = Patient.find(patient_id)
  end

  def find_doctor_name(doctor_id)
    @doctor = Doctor.find(doctor_id)
  end

  def prescription_medicines(prescription_id)
    @medicines = PrescriptionMedicine.where(prescription_id: prescription_id)
  end

  def is_doctor_authorized?
    @doctor = Doctor.find_by(user_id: current_user.id)
    true if @doctor.authorized == true
  end

  def availability_registered?
    @doctor = Doctor.find_by(user_id: current_user.id)
    @availability = Availability.where(doctor_id: @doctor.id)
    true if @availability.length == 0
  end

  def sender_name(sender_id)
    @user = User.find(sender_id)
    if (@user.roles[0].name == 'doctor')
      @name = Doctor.find_by(user_id: @user.id)  
    else
      @name = Patient.find_by(user_id: @user.id)  
    end
    @name.name
  end
  
  end
