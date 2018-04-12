class DiseaseTypesController < ApplicationController

  before_action :super_admin?
  before_action :find_disease, only: [ :show, :update, :delete ]

  def index
    diseases = DiseaseType.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: diseases, status: :ok
  end

  def show
    render json: @disease, status: :ok
  end

  def create
    disease = DiseaseType.new(disease_params)
    if disease.save
      render json: disease, status: :created
    else
      render json: { message: disease.errors }, status: :unprocessable_entity
    end
  end

  def update
    @disease.update!(disease_params)
    head :no_content
  end

  def destroy
    @disease.destroy!
    head :no_content
  end

  private

  def disease_params
    params.require(:disease_type).permit(:name, :main)
  end

  def find_disease
    @disease = DiseaseType.find(params[:id])
  end

end
