class ProvinsiController < ApiController


  # 
  # Provinsi
  # 
  before_action :super_admin?
  before_action :find_provinsi, only: [ :show, :update, :delete ]

  def index
    provinces = Province.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: provinces, status: :ok
  end

  def show
    render json: @province, status: :ok
  end

  def create
    province = Province.new(provinsi_params)
    if province.save
      render json: province, status: :created
    else
      render json: { message: province.errors }, status: :unprocessable_entity
    end
  end

  def update
    @province.update!(provinsi_params)
    head :no_content
  end

  def destroy
    @province.destroy!
    head :no_content
  end

  private

  def provinsi_params
    params.require(:provinsi).permit(:provinsi)
  end

  def find_provinsi
    @province = Province.find(params[:id])
  end
 end

end
