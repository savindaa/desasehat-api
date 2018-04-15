class KabupatenController < ApiController

  # 
  #  Kabupaten
  # 

  before_action :super_admin?
  before_action :find_kabupaten, only: [ :show, :update, :delete ]

  def index
    regencies = Regency.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: regencies, status: :ok
  end

  def show
    render json: @regency, status: :ok
  end

  def create
    regency = Regency.new(kabupaten_params)
    if regency.save
      render json: regency, status: :created
    else
      render json: { message: regency.errors }, status: :unprocessable_entity
    end
  end

  def update
    @regency.update!(kabupaten_params)
    head :no_content
  end

  def destroy
    @regency.destroy!
    head :no_content
  end

  private

  def kabupaten_params
    params.require(:kabupaten).permit(:kabupaten, :province_id)
  end

  def find_kabupaten
    @regency = Regency.find(params[:id])
  end
end
