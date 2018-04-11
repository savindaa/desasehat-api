class MedicalPersonnelsController < ApplicationController

  before_action :super_admin?
  before_action :find_personnel, only: [ :show, :update, :delete ]

  def index
    personnels = MedicalPersonnel.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: personnels, only: [ :id, :name, :agency ], status: :ok
  end

  def show
    render json: @personnel, status: :ok
  end

  def create
    personnel = MedicalPersonnel.new(personnel_params)
    if personnel.save
      render json: personnel, status: :created
    else
      render json: { message: personnel.errors }, status: :unprocessable_entity
    end
  end

  def update
    @personnel.update!(personnel_params)
    head :no_content
  end

  def destroy
    @personnel.destroy!
    head :no_content
  end

  private

  def personnel_params
    params.require(:medical_personnel).permit(:name, :address, :name, :phone, :personnel_type, :village_id)
  end

  def find_personnel
    @personnel = MedicalPersonnel.find(params[:id])
  end

end
