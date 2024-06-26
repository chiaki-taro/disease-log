class DiseasesController < ApplicationController
  before_action :authenticate_user!
  before_action :check_user_id
  before_action :set_patient
  before_action :set_disease, only: [:show, :edit, :update, :destroy]

  def new
    @disease = @patient.diseases.new
  end

  def create
    @disease = @patient.diseases.new(disease_params)
    if @disease.save
      redirect_to user_patient_path(@patient.user, @patient)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @symptoms = @disease.symptoms.order(time: :desc)
  end

  def edit
  end

  def update
    if @disease.update(disease_params)
      redirect_to user_patient_disease_path(@patient.user, @patient, @disease)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @disease.destroy
    redirect_to user_patient_path(@patient.user, @patient)
  end

  private

  def check_user_id
    @user = current_user
    if @user.id != params[:user_id].to_i
      redirect_to root_path
    end
  end

  def set_patient
    @patient = current_user.patients.find(params[:patient_id])
  end

  def set_disease
    @disease = @patient.diseases.find(params[:id])
  end

  def disease_params
    params.require(:disease).permit(:disease_name, :date_of_onset, :status_id)
  end

end
