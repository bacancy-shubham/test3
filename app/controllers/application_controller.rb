class ApplicationController < ActionController::Base
  # before_action :configure_permitted_parameters, if: :devise_controller?

  # protected

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [patient: [ :name, :birthday, :gender,:contact_number, :city]])
  # end
  def after_sign_in_path_for(_resource)
    if current_user.has_role?(:patient)      
      patients_path
    elsif current_user.has_role?(:doctor)
      index_page_doctors_path
    elsif current_user.has_role?(:store)
      medical_stores_path 
    else
      new_user_session_path
    end
  end
end
