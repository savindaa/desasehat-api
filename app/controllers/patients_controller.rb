class PatientsController < ApplicationController

  skip_before_action :authorize_request

  def patients_list
    if params[:search]
      patients = Patient.where(status: "accepted")
                        .where('lower(title) LIKE ?', "%#{params[:search].downcase}%")
                        .order(updated_at: :desc)
                        .paginate(page: params[:page], per_page: params[:limit] || 10)      
    else
      patients = Patient.where(status: "accepted")
                        .order(updated_at: :desc)
                        .paginate(page: params[:page], per_page: params[:limit] || 10)
    end
    render json: patients, 
           only: [:id, :title, :name, :address, :village_id, :fund_current, :fund_goal, :period, :validated_at ],
           methods: [ :disease, :picture, :validated_by, :donation_status ],
           status: :ok
  end

  def patient_detail
    @patient = Patient.find(params[:id])
    render json: @patient,
      status: :ok,
      methods: [ :disease, :pictures, :inputted_by, :validated_by, :donation_status ],
      except: [ :disease_type_id, :validated_by_id, :inputted_by_id, :updated_at ]
  end

end
