class DiseasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient

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

  private

  def set_patient
    @user = User.find(params[:user_id])
    @patient = current_user.patients.find(params[:patient_id])
  end

  def set_disease
    @disease = @patient.diseases.find(params[:id])
  end

  def disease_params
    params.require(:disease).permit(:disease_name, :date_of_onset, :status_id)
  end

end
