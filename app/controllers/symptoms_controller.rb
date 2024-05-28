class SymptomsController < ApplicationController
  before_action :check_user_id
  before_action :set_patient
  before_action :set_disease
  before_action :set_symptom, only: [:edit, :update, :destroy]

  def new
    @symptom = @disease.symptoms.new
  end

  def create
    @symptom = @disease.symptoms.new(symptom_params)
    if @symptom.save
      redirect_to user_patient_disease_path(@user, @patient, @disease)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @symptom.update(symptom_params)
      redirect_to user_patient_disease_path(@user, @patient, @disease)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @symptom.destroy
    redirect_to user_patient_disease_path(@user, @patient, @disease)
  end

  private

  def check_user_id
    @user = current_user
    if @user.id != params[:user_id].to_i
      redirect_to root_path
    end
  end

  def set_patient
    @patient = @user.patients.find(params[:patient_id])
  end

  def set_disease
    @disease = @patient.diseases.find(params[:disease_id])
  end

  def set_symptom
    @symptom = @disease.symptoms.find(params[:id])
  end

  def symptom_params
    params.require(:symptom).permit(:symptoms, :time, :level_id, :treatment, :evaluation, :memo)
  end
end
