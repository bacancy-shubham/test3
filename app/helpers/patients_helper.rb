module PatientsHelper
  def is_requested?(id)              
      Request.find_by(patient_id: params[:patient_id], doctor_id: params[:id], status: "pending")
  end

  def sender_name(sender_id)         
    @user = User.find(sender_id)    
    if (@user.has_role? :doctor)      
      @name = Doctor.find_by(user_id: @user.id)  
    else
      @name = Patient.find_by(user_id: @user.id)  
    end
    @name.name
  end

  def payment
    OrderHistory.where(user_id: current_user.id,status:false).exists?
  end

  def order_history
    OrderHistory.where(user_id: current_user.id,status:true).exists?
  end
end
