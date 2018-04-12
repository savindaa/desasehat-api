class DesaController < ApplicationController

  # 
  #  Desa/Keluarahan
  # 

  before_action :super_admin?
  before_action :find_desa, only: [ :show, :update, :delete ]

  def index
    villages = Village.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: villages, status: :ok
  end

  def show
    render json: @village, status: :ok
  end

  def create
    village = Village.new(desa_params)
    if village.save
      render json: village, status: :created
    else
      render json: { message: village.errors }, status: :unprocessable_entity
    end
  end

  def update
    @village.update!(desa_params)
    head :no_content
  end

  def destroy
    @village.destroy!
    head :no_content
  end

  private

  def desa_params
    params.require(:desa).permit(:kelurahan, :kodepos, :description, :subdistrict_id)
  end

  def find_desa
    @village = Village.find(params[:id])
  end

end
