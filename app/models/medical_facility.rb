class MedicalFacility < ApplicationRecord

  # model Association
  belongs_to :village

  # model Validation
  validates :name, presence: true

end
