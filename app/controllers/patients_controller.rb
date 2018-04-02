class PatientsController < ApplicationController

  def index
    patients = Patient.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: patients.as_json(only: [:id, :disease_type, :name, :age, :village_id]), status: :ok
  end

  def show
    @patient = Patient.find(params[:id])
    render json: @patient, status: :ok
  end

end
