class DoctorsController < ApplicationController

  def index_page
  end
  
  def login
    @user = User.new
    @doctor = Doctor.new
  end

  def create
  @user = User.create!(doctor_params)
    if @user.save
      @user.add_role :doctor
      redirect_to new_user_session_path
    else
      render :login
    end
  end

  def requests
    @doctor = Doctor.find_by(user_id: current_user.id)
    @requests = Request.where(doctor_id: @doctor.id, status: 'pending')
  end

  def request_accept
    @request = Request.find(params[:id])
    @request.status = 'accepted'
    if @request.save
      flash[:notice] = 'Request Accepted'
      redirect_to requests_doctors_path
    else
      flash[:notice] = 'Request not Accepted'
      redirect_to requests_doctors_path
    end
  end

  def request_reject
    @request = Request.find(params[:id])
    @request.status = 'rejected'
    if @request.save
      flash[:notice] = 'Request rejected'
      redirect_to requests_doctors_path
    else
      flash[:notice] = 'Request not rejected'
      redirect_to requests_doctors_path
    end
  end

  def my_patients
    @doctor = Doctor.find_by(user_id: current_user.id)
    @patients = @doctor.my_patients
  end 

  def appoiments
    @doctor = Doctor.find_by(user_id: current_user.id)
    @appoiments = Appoiment.where(doctor_id: @doctor.id)
  end

  def my_profile
    @doctor = Doctor.find_by(user_id: current_user.id)
    @user = current_user
  end

  def availability_form
    @availability = Availability.new
    @doctor = Doctor.find_by(user_id: current_user.id)
  end
  
  def availability_post
    @availability = Availability.new(availability_params)
    @availability.doctor_id = params[:id]
    if @availability.save
      flash[:notice] = 'Online Appoiment Request Activated'
      redirect_to doctors_path
    else
      flash[:notice] = 'Something went wrong'
      redirect_to doctors_path
    end
  end
  
  def prescription_form
    @today_prescription = Prescription.where(patient_id: params[:id]).last
    if @today_prescription != nil
      if @today_prescription.created_at.strftime("%d%m%y") == Date.today.strftime("%d%m%y")
        @prescription_medicine = PrescriptionMedicine.new
        @temp = true
      else
        @temp = false
        @prescription = Prescription.new
        @prescription_medicine = PrescriptionMedicine.new
      end
    else
      @temp = false
      @prescription = Prescription.new
      @prescription_medicine = PrescriptionMedicine.new
    end
  end

  def post_prescription
    @today_prescription = Prescription.where(patient_id: params[:id]).last
    if @today_prescription != nil
      if @today_prescription.created_at.strftime("%d%m%y") == Date.today.strftime("%d%m%y")
        @prescription_medicine = PrescriptionMedicine.new(prescription_medicine_params)
        @prescription_medicine.prescription_id = @today_prescription.id
        @prescription_medicine.save
        redirect_to my_patients_doctors_path
      else
        @prescription = Prescription.new(prescription_params)
        @prescription.patient_id = params[:id] 
        @doctor = Doctor.find_by(user_id: current_user.id)
        @prescription.doctor_id = @doctor.id
        @prescription.save
        redirect_to my_patients_doctors_path
      end
    else
        @prescription = Prescription.new(prescription_params)
        @prescription.patient_id = params[:id] 
        @doctor = Doctor.find_by(user_id: current_user.id)
        @prescription.doctor_id = @doctor.id
        @prescription.save
        redirect_to my_patients_doctors_path
    end
  end

  def open_chat
    @doctor = Doctor.find_by(user_id: current_user.id)
    @patient = Patient.find(params[:id])
    @messages = Message.where(sender_id: @doctor.user_id, receiver_id: @patient.user_id).or(Message.where(sender_id: @patient.user_id, receiver_id: @doctor.user_id))
  end

  def send_message
  
    @message = Message.new(message_params)
    @message.sender_id = current_user.id
    @message.receiver_id = params[:id]
    if @message.save
      @patient = Patient.find_by(user_id: params[:id])
      redirect_to open_chat_doctor_path(@patient.id)
    else
      flash[:notice] = 'Something went wrong'
    end
  end

  def medical_history
    @patient_prescription = Prescription.where(patient_id: params[:id])
  end
  
  private
  def doctor_params
    params.require(:user).permit(:email, :password,:password_confirmation, doctor_attributes: [:name, :degrees, :specialization, :hospital_id])
  end

  def availability_params
    params.require(:availability).permit(:doctor_id, :available_from_1, :available_from_2, :available_from_3, :available_from_4, :available_from_5, :available_from_6, :available_from_7, :available_to_1, :available_to_2, :available_to_3, :available_to_4, :available_to_5, :available_to_6, :available_to_7)
  end

  def message_params
    params.require(:message).permit(:message)
  end

  def prescription_params
    params.require(:prescription).permit(:disease, prescription_medicines_attributes: [:id, :medicine, :quantity])
  end

  def prescription_medicine_params
    params.require(:prescription_medicine).permit(:medicine, :quantity)
  end
end
