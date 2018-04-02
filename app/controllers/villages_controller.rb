class VillagesController < ApplicationController

  # find record before action is executed
  before_action :find_village, only: [ :show, :update, :destroy ]

  # return list of all villages
  # GET /desa
  def index
    villages = Village.all.paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: villages.as_json(only: [ :id, :name, :kecamatan, :kabupaten, :provinsi ]), status: :ok
  end

  # return detail of a village record
  # GET /desa/:id
  def show
    render json: @village, status: :ok
  end

  # create a new village record
  # POST /desa
  def create
    village = Village.new(village_params)
     if village.save
       render json: village, status: :created
    else
       render json: { errors: village.errors }, status: :unprocessable_entity
    end
  end

  # update village attribute
  # PUT /desa/:id
  def update
    @village.update(village_params)
    head :no_content
  end

  # delete village record
  # DELETE /desa/:id
  def destroy
    @village.destroy
    head :no_content
  end

  # # finding village record with parameter provinsi -> kabupaten -> kecamatan
  # # GET /desa/pilih
  # def select_village
  #   if params[:provinsi] && params[:kabupaten] && params[:kecamatan]
  #     # if provinsi, kabupaten and kecamatan parameter is provided then return list of village name
  #     render json: Village.where(provinsi: params[:provinsi], kabupaten: params[:kabupaten], kecamatan: params[:kecamatan]).select(:id, :name), status: :ok
  #
  #   elsif params[:provinsi] && params[:kabupaten]
  #     # if provinsi and kabupaten parameter is provided then return list of distinct kecamatan
  #     render json: Village.where(provinsi: params[:provinsi], kabupaten: params[:kabupaten]).distinct.select(:kecamatan).as_json(except: :id), status: :ok
  #
  #   elsif params[:provinsi]
  #     # if provinsi parameter is provided then return list of distinct kabupaten
  #     render json: Village.where(provinsi: params[:provinsi]).distinct.select(:kabupaten).as_json(except: :id), status: :ok
  #
  #   else
  #     # if there is no provinsi parameter provided, return list of distinct provinsi
  #     render json: Village.distinct.select(:provinsi).as_json(except: :id), status: :ok
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
