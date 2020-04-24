# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:update]

  # GET /resource/sign_up
  def new
    @user = User.new
    @patient = Patient.new
  end

  # POST /resource
  def create
    @user = User.new(patient_params)
    if @user.save
       @user.add_role :patient
       redirect_to patients_path
    else
      render :new
    end
  end

  def patient_params
    params.require(:user).permit(:email, :password, :password_confirmation, patient_attributes: [:name, :birthday, :gender, 
    :contact_number, :city])
  end
  
  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #    devise_parameter_sanitizer.permit(:sign_up, keys: [patient_attributes: [ :name, :birthday, :gender,:contact_number, :city]])
  #   # devise_parameter_sanitizer.permit(:sign_up, keys: [doctor_attributes: [:name, :hospital_id]])
  # end

  # private

  # def patient_param
  #   params.require(:user).permit(:email, :password,patient_attributes: [:id, :name, :birthday, :gender,:contact_number, :city])
  # end


  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [patient_attributes: [ :name, :birthday, :gender,:contact_number, :city]])
  end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   redirect_to dashboard_home_path
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
