class TotalResidentsController < ApiController

  before_action :super_admin?
  before_action :find_resident, only: [ :update, :delete ]

  def index
    resident = TotalResident.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: resident, status: :ok
  end

  def create
    resident = TotalResident.new(find_resident)
    if resident.save
      render json: resident, status: :created
    else
      render json: { message: resident.errors }, status: :unprocessable_entity
    end
  end

  def update
    @resident.update!(find_resident)
    head :no_content
  end

  def destroy
    @resident.destroy!
    head :no_content
  end

  private

  def kecamatan_params
    params.require(:total_resident).permit(:total, :village_id)
  end

  def find_resident
    @resident = TotalResident.find(params[:id])
  end


end
