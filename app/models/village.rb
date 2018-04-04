class Village < ApplicationRecord
  # model Association
  has_many :medical_facilities, dependent: :destroy
  has_many :medical_personnels, dependent: :destroy
  has_many :total_residents, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :users, dependent: :destroy
  has_many :admins, dependent: :destroy

  # model Validation
  validates :name, :kecamatan, :kabupaten, :provinsi, presence: true
end
