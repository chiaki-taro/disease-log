class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user
  before_action :set_patient, only: [:show, :edit, :update, :destroy]

  def index
    @patients = @user.patients.order(patient_name: :asc)
  end

  def new
    @patient = @user.patients.new
  end

  def create
    @patient = @user.patients.new(patient_params)
    if @patient.save
      redirect_to user_patients_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  def update
    if @patient.update(patient_params)
      redirect_to user_patient_path(@user, @patient)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @patient.destroy
    redirect_to user_patients_path(@user)
  end

  private

  def set_user
    @user = current_user
  end

  def set_patient
    @patient = @user.patients.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:patient_name, :sex_id, :birthday)
  end
end
