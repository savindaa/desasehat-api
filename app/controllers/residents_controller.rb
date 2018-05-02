class ResidentsController < ApplicationController

  skip_before_action :authorize_request

 def update_log
   patients = Patient.where(status: "accepted", village_id: 1)
   patients.select(:disease_type).distinct.each do |data|
     disease_type = data.disease_type
     sick_resident = patients.where(disease_type: disease_type).size
     log = Resident.where(disease_type: disease_type, input_date: Date.today.beginning_of_month)
     if log.blank?
       Resident.create!(
         input_date: Date.today.beginning_of_month,
         input_type: "penduduk_sakit",
         disease_type: disease_type,
         total: sick_resident,
         village_id: 1
       )
     elsif log[0].total != sick_resident
       log.update(total: sick_resident)
     end
   end
 end

 def show
   limit = (params[:limit] || 12).to_i
   @residents = Resident.where("village_id = ?", params[:id])
   unless @residents.blank?
   log = {}
   log[:village] = @residents.first.village_id
   log[:log] = []

   @residents.select(:input_date).distinct.order(input_date: :desc).limit(limit).each do |r|
     current_log = {}
     current_log[:date] = r.input_date.strftime "%m-%Y"

     if update_total_resident
       current_log[:total_residents] = @residents.find_by(input_date: r.input_date, input_type: "jumlah_penduduk").total
     else
       current_log[:total_residents] = nil
     end

     current_log[:total_sick_resident] = 0
     current_log[:sick_resident_detail] = []

     @residents.where(input_date: r.input_date, input_type: "penduduk_sakit").each do |q|
       current_log[:total_sick_resident] += q.total
       current_log[:sick_resident_detail].push(disease_type: q.disease_type, total: q.total)
     end

     log[:log].push(current_log)
   end

   render json: log, status: :ok

  else
    render json: { message: "Record is Empty" }, status: :ok
  end
 rescue ActiveRecord::StatementInvalid
   raise ExceptionHandler::StatementInvalid, "Statement Invalid"
 end

 def update_total_resident
   this_month = Date.today.beginning_of_month
   total_residents = @residents.where(input_type: "jumlah_penduduk")
   unless total_residents.blank?
     total_current_resident = total_residents.find_by(input_date: this_month)
     if total_current_resident.blank?
       total_previous_resident = total_residents.find_by(input_date: this_month >> -1)
       Resident.create(input_date: this_month, input_type: "jumlah_penduduk", total: total_previous_resident.total, village_id: total_previous_resident.village_id[:id])
       return true
     else
       return true
     end
   else
     return false
   end
 end

end
