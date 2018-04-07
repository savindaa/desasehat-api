class VillagesController < ApplicationController

  # find record before action is executed
  before_action :find_village, only: [ :show ]

  skip_before_action :authorize_request

  # return list of all villages
  # GET /desa
  def index
    villages = Village.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: villages, status: :ok, only: [:id, :kelurahan], methods: [:kecamatan, :kabupaten, :provinsi]
  end

  # return detail of a village record
  # GET /desa/:id
  def show
    render json: @village, status: :ok, methods: [:kecamatan, :kabupaten, :provinsi]
  end

  # def pick_desa
  #   if !params[:prov].blank?
  #     if !params[:kab].blank?
  #       if !params[:kec].blank?
  #         subdistricts = Subdistrict.find(params[:kec])
  #         render json: { provinsi: subdistricts.regency.province.provinsi, kabupaten: subdistricts.regency.kabupaten, kecamatan: subdistricts.kecamatan, list_desa: subdistricts.villages.as_json(only: [:id, :kelurahan]) }, status: :ok
  #       else
  #         regency = Regency.find(params[:kab])
  #         render json: { provinsi: regency.province.provinsi, kabupaten: regency.kabupaten, list_kecamatan: regency.subdistricts.as_json(only: [:id, :kecamatan]) }, status: :ok
  #       end
  #     else
  #       province = Province.find(params[:prov])
  #       render json: { provinsi: province.provinsi, list_kabupaten: province.regencies.as_json(only: [:id, :kabupaten]) }, status: :ok
  #     end
  #   else
  #     render json: Province.all, only: [:id, :provinsi], status: :ok
  #   end
  # end

  private

  # escape strong parameter
  def village_params
    params.require(:village).permit(:name, :kecamatan, :kabupaten, :provinsi, :description)
  end

  # find village based on :id parameter
  def find_village
    @village = Village.find(params[:id])
  end

end
