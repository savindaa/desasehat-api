class Resident < ApplicationRecord

  # model Association
  belongs_to :village

  # model Validation
  validates :input_date, :input_type, :total, presence: true

  # enum on type
  enum input_type: [ :jumlah_penduduk, :penduduk_sakit ]

  def village_id
    {
      id: self.village.id,
      name: self.village.name,
      kecamatan: self.village.kecamatan,
      kabupaten: self.village.kabupaten,
      provinsi: self.village.provinsi
    }
  end

end
