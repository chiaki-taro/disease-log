class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: :show

  def show
    @patients = @user.patients.order(patient_name: :asc)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
