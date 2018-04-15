class PatientsController < ApiController

  skip_before_action :authorize_request

  def patients_list
    patients = Patient.where(status: "accepted").paginate(page: params[:page], per_page: params[:limit] || 10)
    render json: patients, only: [:id, :name, :age, :village_id ], methods: [ :disease, :picture, :validated_by ], status: :ok
  end

  def patient_detail
    @patient = Patient.find(params[:id])
    render json: @patient,
      status: :ok,
      methods: [ :disease, :pictures, :inputted_by, :validated_by ],
      except: [ :disease_type_id, :validated_by_id, :inputted_by_id, :updated_at ]
  end

end
