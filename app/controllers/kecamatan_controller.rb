class KecamatanController < ApplicationController

  # 
  #  Kecamatan
  # 
  before_action :super_admin?
  before_action :find_kecamatan, only: [ :show, :update, :delete ]

  def index
    subdistricts = Subdistrict.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: subdistricts, status: :ok
  end

  def show
    render json: @subdistrict, status: :ok
  end

  def create
    subdistrict = Subdistrict.new(kecamatan_params)
    if subdistrict.save
      render json: subdistrict, status: :created
    else
      render json: { message: subdistrict.errors }, status: :unprocessable_entity
    end
  end

  def update
    @subdistrict.update!(kecamatan_params)
    head :no_content
  end

  def destroy
    @subdistrict.destroy!
    head :no_content
  end

  private

  def kecamatan_params
    params.require(:kecamatan).permit(:kecamatan, :regency_id)
  end

  def find_kecamatan
    @subdistrict = Subdistrict.find(params[:id])
  end

end
