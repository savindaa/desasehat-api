class Village < ApplicationRecord
  # model Association
  belongs_to :subdistrict
  has_many :medical_facilities, dependent: :destroy
  has_many :medical_personnels, dependent: :destroy
  has_many :total_residents, dependent: :destroy
  has_many :patients, dependent: :destroy
  has_many :users, dependent: :destroy

  # model Validation
  validates :kelurahan, presence: true

  def kecamatan
    self.subdistrict.kecamatan
  end

  def kabupaten
    self.subdistrict.regency.kabupaten
  end

  def provinsi
    self.subdistrict.regency.province.provinsi
  end

end
