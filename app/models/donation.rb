class Donation < ApplicationRecord
  belongs_to :patient
  belongs_to :payment_option

  # image uploader
  mount_base64_uploader :picture, PictureUploader

  validates :name, :phone, :amount, presence: true

  enum status: [ :pending, :accepted, :declined ] 

  def exp_date
    self.patient.validated_at + self.patient.period
  end
end
