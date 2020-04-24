class PatientsController < ApplicationController
  before_action :authenticate_user!
  def index
    @doctors = Doctor.all
    @hospitals = Hospital.all
  end

  def message_send  
     @message = Message.new       
     @request = Request.find_by(doctor_id: params[:id])
     @patient = Patient.find_by(user_id: current_user.id) 
     @doctor = Doctor.find(params[:id])   
     @messages = Message.where(sender_id: @patient.user_id, receiver_id: @doctor.user_id).or(Message.where(sender_id: @doctor.user_id, receiver_id: @patient.user_id))         
     #@messages = Message.where('sender_id = ? AND receiver_id = ?', params[:id], params[:patient_id])       
  end

  def message_create    
      message = Message.new(message_params)
      if !message.save
        flash[:notice] = 'Something went wrong'
      end
      redirect_to message_patient_path(params[:id], patient_id: current_user.patient.id)
  end

  def message_requst        
    is_requested = Request.find_by(patient_id: current_user.patient.id, doctor_id: params[:id])
    if is_requested == nil
      Request.create(status: 0, patient_id: current_user.patient.id, doctor_id: params[:id])
      flash[:notice] = "requst has been sent successfully"    
    else
      flash[:notice] = "request is alredy sent"
    end
    redirect_to message_patient_path(params[:id], patient_id: current_user.patient.id)
  end

  def prescription
    @prescriptions = Prescription.all.where('doctor_id = ? AND patient_id = ? ', params[:id],
    params[:patient_id])     
  end
 
  def appoiment   
    @appoiment = Appoiment.new 
    @appoiments = Appoiment.all.where('doctor_id = ? AND patient_id = ?', params[:id],
    params[:patient_id])
  end

  def appoiment_send
    # time = "#{params['time(4i)']}:#{params['time(5i)']}"
    # Appoiment.create(timing: time, date: params[:date], doctor_id: params[:id],
    #  patient_id: params[:patient_id]) 
     appoiment = Appoiment.new(appoiment_params)
     if appoiment.save
      flash[:notice] = "appoiment has been book successfully"  
     else
      flash[:notice] = "Something went wrong"
     end  
    redirect_to appoiment_patient_path(patient_id: current_user.patient.id)       
  end

  def medical_store    
    @order = Order.new
    @stores = MedicalStore.all.map{ |u| [ u.name, u.id ] }
    @prescriptions = Prescription.all.where('doctor_id = ? AND patient_id = ? ', params[:id],
    params[:patient_id])  
  end

  def place_order
   if params[:presciption_ids] != nil
    (params[:presciption_ids]).each do |a|
      medicine =  MedicineStock.find_by(name:a).medicine
      quantity =  PrescriptionMedicine.find(a).quantity     
      @order = Order.new(medical_store_id: params[:order][:store_id],medicine: medicine,
        quantity: quantity,patient_id: params[:id])
      end
      if @order.save
        flash[:notice] = "order placed successfully"
      else
        flash[:notice] = "order not placed"
      end
    else
      flash[:notice] = "First select medicine"
    end
    redirect_to store_patient_path(params[:id], patient_id: current_user.patient.id) 
  end

 private
  def message_params    
    params.require(:message).permit(:message, :sender_id, :receiver_id)
  end
  def appoiment_params    
    params.require(:appoiment).permit(:date, :timing, :doctor_id, :patient_id)
  end
end
