class OtpAuthController < ApplicationController
  require 'open-uri'

  skip_before_action :authorize_request

  def signup
    user = User.new(auth_params.except(:id, :otp))
    if user.save!
      otp = 4.times.map{rand(10)}.join
      user.verification = Verification.new(code: otp)
      user.privileges << Privilege.find(3)
      send_otp(user.phone, otp)
      render json: { user: { id: user.id, name: user.name, phone: user.phone } }, status: :created
    else
      render json: { message: user.errors }, status: :unprocessable_entity
    end
  end

  # POST user/login
  def login
    user = User.find_by(phone: auth_params[:phone])
    if user
      # generating random 4 digit string number
      otp = 4.times.map{rand(10)}.join
      # store otp result to db
      user.verification ? user.verification.update(code: otp) : user.verification = Verification.new(code: otp)
      send_otp(user.phone, otp)
      # return user name if the record exist
      render json: { user: { id: user.id, name: user.name, phone: user.phone } }, status: :ok
    else
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.user_not_found)
    end
  end

  # POST user/resend
  def resend_otp
    user = User.find_by!(phone: auth_params[:phone])
    raise(ExceptionHandler::StatementInvalid, "Tidak ada kode OTP.") if user.verification.blank?
    send_otp(user.phone, user.verification.code)
    render json: { message: "Kode telah dikirim ulang." }, status: :ok
  end

  # POST user/verify
  def verify_otp
    user = User.find(auth_params[:id])
    raise(ExceptionHandler::StatementInvalid, "Tidak ada kode OTP.") if user.verification.blank?
    if user.verification[:code] == auth_params[:otp]
      auth_token = JsonWebToken.encode({ user_id: user.id }, 10.years.from_now)
      privileges = user.privileges.as_json(only: [:id, :name, :su_only])
      render json: { auth_token: auth_token, user: user, user_privileges: privileges }
      user.verification.destroy
    else
      raise(ExceptionHandler::AuthenticationError, Message.otp_not_match)
    end
  end
  private

  def auth_params
    params.require(:otp_auth).permit(:phone, :id, :otp, :name, :address, :village_id)
  end

  def send_otp(phone, otp)
    userkey = ENV["SMSGATEWAY_USERKEY"]
    passkey = ENV["SMSGATEWAY_PASSKEY"]
    device_id = ENV["SMSGATEWAY_DEVICE_ID"]
    link = "http://smsgateway.me/api/v3/messages/send?email=#{userkey}&password=#{passkey}&device=#{device_id}&number=#{phone}&message="+
           "&pesan=Silahkan%20masukan%20kode%20berikut%20ke%20aplikasi%20Desasehat%0A%0A#{otp}%0A%0A"
    @req = URI.parse(link).read
  rescue OpenURI::HTTPError
  end

end
