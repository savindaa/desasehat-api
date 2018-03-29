class PatientsController < ApplicationController

  def index
    patients = Patient.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: patients, status: :ok, fields: [ :id, :name, :gender, :disease_type, :village, :status, :age, :date_of_birth, :place_of_birth ]
  end

end
