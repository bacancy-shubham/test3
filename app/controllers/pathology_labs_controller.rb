class PathologyLabsController < ApplicationController

  def login
    @user = User.new
    @pathology_lab = PathologyLab.new
  end

  def create
  @user = User.new(lab_params)
    if @user.save
      @user.add_role :lab
      # redirect_to pathology_labs_path
    else
      render :login
      
    end
  end

  def lab_params
    params.require(:user).permit(:email, :password, pathology_lab_attributes: [:name, :address, :contact_number])
  end

end
