class PatientsController < ApplicationController

  def index
    patients = Patient.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: patients, status: :ok, fields: [ :id, :name, :gender, :disease_type, :village, :date_of_birth, :place_of_birth, :age, :status]
  end

  def show
    patient = Patient.find(params[:id])
    render json: patient, status: :ok
  end

  def dashboard
    patients = Patient.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: patients, status: :ok, fields: [ :id, :name, :disease_type, :village, :age]

  end

end
