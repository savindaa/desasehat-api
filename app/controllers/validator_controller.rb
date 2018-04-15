class ValidatorController < ApiController

  before_action :validator?

  before_action :find_patient, only: [ :validate_patient, :decline_patient, :pending_patient_detail ]

  def list_pending_patient
    patients = Patient.where(village_id: @current_user.village_id, status: "pending").paginate(page: params[:page], per_page: params[:limit] || 10).
      order(:name)
    render json: patients, only: [:id, :name, :age, :village_id], methods: [ :disease, :picture, :inputted_by ], status: :ok
  end

  def my_validated_patient
    patients = @current_user.validates.paginate(page: params[:page], per_page: params[:limit] || 10).order(updated_at: :desc)
    render json: patients, only: [:id, :name, :age, :village_id, :status], methods: [ :disease, :picture, :inputted_by ], status: :ok
  end

  def validate_patient
    @patient = Patient.find(params[:id])
    if @current_user.village_id == @patient.village_id[:id]
      if @current_user.id == @patient.inputted_by_id
        raise ExceptionHandler::StatementInvalid, "Campaign tidak bisa divalidasi oleh Anda sendiri."
      else
        if @patient.status == "accepted"
          raise ExceptionHandler::StatementInvalid, "Campaign telah tervalidasi sebelumnya."
        else
          @patient.update(status: "accepted", validated_by_id: @current_user.id)
          render json: { message: "Campaign tervalidasi."}, status: :ok
        end
      end
    else
      raise(ExceptionHandler::AuthenticationError, "Campaign berada di desa yang berbeda dengan Anda.")
    end
  end

  def decline_patient
    if @current_user.village_id == @patient.village_id[:id]
      if @current_user.id == @patient.inputted_by_id
        raise ExceptionHandler::StatementInvalid, "Campaign tidak bisa ditolak oleh Anda sendiri."
      else
        raise ExceptionHandler::StatementInvalid, "Campaign telah dtolak sebelumnya." if @patient.status == "declined"
        message = @patient.patient_message.new(message_params)
        if message.save
          @patient.update(status: "declined", validated_by_id: @current_user.id)
          render json: { message: "Campaign ditolak."}, status: :ok            
        else
          render json: { message: message.errors }, status: :unprocessable_entity			
        end
      end
    else
      raise(ExceptionHandler::AuthenticationError, "Campaign berada di desa yang berbeda dengan Anda.")
    end
  end

  private

  def validator?
    raise(ExceptionHandler::AuthenticationError, Message.unauthorized) if @current_user.privileges.find_by(id: 2).blank?
  end

  def find_patient
    @patient = Patient.find(params[:id])
  end

  def message_params
    params.require(:validator).permit(:message)
  end

end
