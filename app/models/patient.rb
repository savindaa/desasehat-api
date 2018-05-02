class Patient < ApplicationRecord

  # model Association
  belongs_to :village
  belongs_to :user

  # model Validation
  validates :name, :dob, :gender, :disease_type, :status, :blood_type, presence: true

  # enum on status
  enum status: [ :draft, :pending, :accepted, :declined, :cured ]

end
