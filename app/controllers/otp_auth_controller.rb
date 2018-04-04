class OtpAuthController < ApplicationController
  require 'open-uri'

  skip_before_action :authorize_request

  # POST user/login
  def login
    user = User.find_by(phone: auth_params[:phone])
    if user
      # generating random 4 digit string number
      otp = 4.times.map{rand(10)}.join
      # store otp result to db
      user.update(otp: otp)
      send_otp(user.phone, otp)
      # return user name if the record exist
      render json: { user: { id: user.id, name: user.name } }
    else
    # raise Authentication error if credentials are invalid
    raise(ExceptionHandler::AuthenticationError, Message.user_not_found)
    end
  end

  # POST user/verify
  def verify_otp
    user = User.find(otp_params[:user_id])
    if user.otp == otp_params[:otp]
      auth_token = JsonWebToken.encode(user_id: user.id)
      render json: { auth_token: auth_token }
      user.update(otp: nil)
    else
      raise(ExceptionHandler::AuthenticationError, Message.otp_not_match)
    end
  end
  private

  def auth_params
    params.require(:otp_auth).permit(:phone)
  end

  def otp_params
    params.require(:otp_auth).permit(:user_id, :otp)
  end

  def send_otp(phone, otp)
    userkey = ENV["ZENZIVA_USERKEY"]
    passkey = ENV["ZENZIVA_PASSKEY"]
    link = "https://reguler.zenziva.net/apps/smsapi.php?userkey=#{userkey}&passkey=#{passkey}&nohp=#{phone}&pesan=Silahkan%20masukan%20kode%20berikut%20ke%20aplikasi%20Desasehat%0A%0A#{otp}%0A%0A"
    @req = URI.parse(link).read
  end
end
