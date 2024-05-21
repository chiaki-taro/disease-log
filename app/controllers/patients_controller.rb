class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user

  def index
    @patients = @user.patients.order(patient_name: :asc)
  end

  def new
    @patient = @user.patients.new
  end

  private

  def set_user
    @user = current_user
  end

  def patient_params
    params.require(:patient).permit(:patient_name, :sex_id, :birthday)
  end
end
