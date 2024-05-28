class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_id
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
    @diseases = @patient.diseases
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

  def check_user_id
    @user = current_user
    if @user.id != params[:user_id].to_i
      redirect_to root_path
    end
  end

  def set_patient
    @patient = @user.patients.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:patient_name, :sex_id, :birthday)
  end
end