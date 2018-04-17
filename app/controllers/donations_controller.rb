class DonationsController < ApplicationController
  require 'open-uri'
  skip_before_action :authorize_request
  before_action :find_donation, only: [ :update, :show ]

  def create
    donation = Patient.find(params[:id]).donations.new
    raise(ExceptionHandler::StatementInvalid, Message.exp_donation) if (donation.patient.donation_status == "Inactive")
    donation.status = "pending"
    donation.unique_code = [rand(1..4), 2.times.map{rand(1..9)}.join].join.to_i
    if donation.save
      payment =  donation.amount + donation.unique_code
      send_notification(
        donation.id,
        donation.phone,
        payment.to_s.reverse.gsub(/...(?=.)/,'\&.').reverse,
        I18n.l(donation.exp_date,format: :day_short)
        )
      render json: donation,
             methods: :exp_date,
             status: :ok
    else
      render json: { message: donation.errors }, status: :unprocessable_entity
    end
  end

  private

  def find_donation
    @donation = Donation.find(params[:id])
  end

  def donation_params
    params.require(:donation).permit(:phone, :name, :amount, :comment)    
  end

  def send_notification(id, phone, amount, exp_time)
    userkey = ENV["ZENZIVA_USERKEY"]
    passkey = ENV["ZENZIVA_PASSKEY"]
    link = "https://reguler.zenziva.net/apps/smsapi.php?userkey=#{userkey}&passkey=#{passkey}&nohp=#{phone}&pesan=Silahkan%20masukan%20kode%20berikut%20ke%20aplikasi%20Desasehat%0A%0A#{}%0A%0A"
    @req = URI.parse(link).read
  end

end
