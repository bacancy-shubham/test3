class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_one :doctor, dependent: :destroy
  accepts_nested_attributes_for :doctor

  has_one :patient, dependent: :destroy
  accepts_nested_attributes_for :patient
  
  # has_one :hospital, dependent: :destroy
  # accepts_nested_attributes_for :hospital
  
  has_one :medical_store, dependent: :destroy
  accepts_nested_attributes_for :medical_store

  has_one :pathology_labs, dependent: :destroy
  accepts_nested_attributes_for :pathology_labs
  # after_create :create_account
  # def create_account
  #   @user = User.last
  #   @user.add_role :patient
  # end
  validates :password_confirmation, presence: true, on: :create

end
