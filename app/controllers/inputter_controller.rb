class InputterController < ApplicationController

  before_action :inputter?

  def list_disease
    diseases = DiseaseType.all
    render json: diseases, only: [ :id, :name ], status: :ok
  end

  def create_patient
    patient = @current_user.inputs.new(patient_params.except(:picture))
    raise(ExceptionHandler::StatementInvalid, Message.max_upload(3)) if patient_params[:picture].size > 3
    patient.village_id = @current_user.village_id
    patient.status = "pending"
    if patient.save
      unless patient_params[:picture].blank?
        patient_params[:picture].map do |pict|
          patient.patient_pictures.create!(picture: pict)
        end
      end
      render json: patient,
        status: :created,
        methods: [ :disease, :picture, :inputted_by, :validated_by ],
        except: [ :disease_type_id, :validated_by_id, :inputted_by_id, :updated_at ]
    else
      render json: { message: patient.errors }, status: :unprocessable_entity
    end
  end

  def my_inputted_patient
    patients = @current_user.inputs.where.not(status: "cured").
                            paginate(page: params[:page], per_page: params[:limit] || 10).
                            order(updated_at: :desc)
    render json: patients, 
           only: [:id, :name, :age, :village_id, :status], 
           methods: [ :disease, :picture ], status: :ok
  end

  def delete_patient
    patient = @current_user.inputs.find(params[:id])
    raise(ExceptionHandler::StatementInvalid, Message.patient_accepted) if (patient.status == "accepted") || (patient.status == "cured")
    patient.destroy
    head :no_content
  end

  def update_patient
    patient = @current_user.inputs.find(params[:id])
    if patient.update!(patient_params.except(:picture))
      unless patient_params[:picture].blank?
        patient.patient_pictures.destroy_all
        patient_params[:picture].map do |pict|
          patient.patient_pictures.create!(picture: pict)
        end
      end
    else
      render json: { message: patient.errors }, status: :unprocessable_entity
    end
  end

  private

  def inputter?
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) if @current_user.privileges.find_by(id: 3).blank?
  end

  def patient_params
    params.require(:inputter).permit(:name, :address, :phone, :pob, :dob, :gender, :blood_type, :description, :disease_type_id, picture: [])
  end

end
