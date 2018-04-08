class VillagesController < ApplicationController

  skip_before_action :authorize_request

  def village_dropdown
    if !params[:prov].blank?
      province = Province.find(params[:prov])
      if !params[:kab].blank?
        regency = province.regencies.find(params[:kab])
        if !params[:kec].blank?
          subdistricts = regency.subdistricts.find(params[:kec])
          render json: subdistricts.villages, only: [:id, :kelurahan], status: :ok
        else
          render json: regency.subdistricts, only: [:id, :kecamatan], status: :ok
        end
      else
        render json: province.regencies, only: [:id, :kabupaten], status: :ok
      end
    else
      render json: Province.all, only: [:id, :provinsi], status: :ok
    end
  end

  def village_statistic
    @date_log = Date.new( date_year, date_month ).end_of_month
    patients = Patient.where("village_id = ?", params[:id]).where("created_at <= ?", @date_log).where(status: "accepted")
    unless patients.blank?
      log = {
        village_detail: patients.first.village_id,
        date: "#{I18n.l(@date_log, format: :short)}",
        total_resident: total_resident,
        total_sick_residents: patients.size,
        sick_residents_detail: []
      }

      patients.select(:disease_type).distinct.map do |data|
        current_log = {
          disease_type: data.disease_type,
          total: patients.where(disease_type: data.disease_type).size
        }
        log[:sick_residents_detail].push(current_log)
      end

      render json: log, status: :ok
    else
      raise ActiveRecord::RecordNotFound, "Data tidak ditemukan"
    end
  end

  private

  # escape strong parameter
  def village_params
    params.require(:village).permit(:name, :kecamatan, :kabupaten, :provinsi, :description)
  end

  # find village based on :id parameter
  def find_village
    @village = Village.find(params[:id])
  end

  def date_year
    unless params[:tahun].blank?
      if params[:tahun].to_i >= 2000
        params[:tahun].to_i
      else
        raise ExceptionHandler::InvalidDate, "Parameter tahun harus lebih dari tahun 2000"
      end
    else
      Date.today.year
    end
  end

  def date_month
    unless params[:bulan].blank?
      if params[:bulan].to_i > 0 && params[:bulan].to_i < 13
        params[:bulan].to_i
      else
        raise ExceptionHandler::InvalidDate, "Parameter bulan salah"
      end
    else
      Date.today.month
    end
  end

  def total_resident
    people_count = TotalResident.where("village_id = ?", params[:id]).where("created_at <= ?", @date_log).last
    people_count.blank? ? 0 : people_count.total
  end

end
