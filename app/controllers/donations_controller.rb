class DonationsController < ApplicationController
  require 'open-uri'
  skip_before_action :authorize_request
  before_action :find_donation, only: [ :update, :show ]

  def create
    donation = Patient.find(params[:id]).donations.new(donation_params)
    raise(ExceptionHandler::StatementInvalid, Message.exp_donation) if (donation.patient.donation_status == "Inactive")
    donation.status = "pending"
    donation.unique_code = [rand(1..4), 2.times.map{rand(1..9)}.join].join.to_i
    if donation.save
      payment =  donation.amount + donation.unique_code
      send_notification(
        donation.id,
        donation.phone,
        donation.payment_option,
        payment.to_s.reverse.gsub(/...(?=.)/,'\&.').reverse,
        I18n.l(donation.exp_date,format: :day_short).gsub(/\s+/, "")
        )
      render json: donation,
             methods: :exp_date,
             status: :ok
    else
      render json: { message: donation.errors }, status: :unprocessable_entity
    end
  end

  def list_payment
    payments = PaymentOption.all
    render json: payments, status: :ok
  end

  private

  def find_donation
    @donation = Donation.find(params[:id])
  end

  def donation_params
    params.require(:donation).permit(:phone, :name, :amount, :comment, :payment_option_id)    
  end

  def send_notification(id, phone, payment_option, amount, exp_time)
    userkey = ENV["SMSGATEWAY_USERKEY"]
    passkey = ENV["SMSGATEWAY_PASSKEY"]
    device_id = ENV["SMSGATEWAY_DEVICE_ID"]
    link = "http://smsgateway.me/api/v3/messages/send?email=#{userkey}&password=#{passkey}&device=#{device_id}&number=#{phone}&message="+
            "DESASEHAT%3A%20Segera%20transfer%20Rp%20#{amount}%20ke%20#{payment_option.name}%20#{payment_option.account_number}%20an."+
            "%20YAYASAN%20DESASEHAT%20/u%20donasi%20%23#{id}%20sblm%20#{exp_time}%0D%0Akonfirmasi%20ke%20082213451346"
    @req = URI.parse(link).read
    rescue OpenURI::HTTPError
  end

end
