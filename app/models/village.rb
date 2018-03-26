class Village < ApplicationRecord
  # model Association
  has_many :medical_facilities
  has_many :medical_personnels
  has_many :residents
  has_many :patients
  has_many :users
  has_many :admins

  # model Validation
  validates :name, :kecamatan, :kabupaten, :provinsi, presence: true
end
