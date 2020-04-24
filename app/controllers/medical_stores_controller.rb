class MedicalStoresController < ApplicationController
    before_action :authenticate_user!, except: [:login, :create]

  def login
    @user = User.new
    @medical_store = MedicalStore.new
  end
  def create
  @user = User.new(store_params)
    if @user.save
      @user.add_role :store
      redirect_to new_user_session_path
    else
      render :login
    end
  end 

  def store_params
    params.require(:user).permit(:email, :password, :password_confirmation, medical_store_attributes: [:name, :city, :contact_number])
  end
  
end
