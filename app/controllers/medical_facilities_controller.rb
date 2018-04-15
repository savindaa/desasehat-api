class MedicalFacilitiesController < ApiController

  before_action :super_admin?
  before_action :find_facility, only: [ :show, :update, :delete ]

  def index
    facilities = MedicalFacility.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: facilities, only: [ :id, :name, :facility_type ], status: :ok
  end

  def show
    render json: @facility, status: :ok
  end

  def create
    facility = MedicalFacility.new(facility_params)
    if facility.save
      render json: facility, status: :created
    else
      render json: { message: facility.errors }, status: :unprocessable_entity
    end
  end

  def update
    @facility.update!(facility_params)
    head :no_content
  end

  def destroy
    @facility.destroy!
    head :no_content
  end

  private

  def facility_params
    params.require(:medical_facility).permit(:name, :address, :name, :phone, :facility_type, :village_id)
  end

  def find_facility
    @facility = MedicalFacility.find(params[:id])
  end

end
