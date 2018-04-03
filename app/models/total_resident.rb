class TotalResident < ApplicationRecord

  belongs_to :village

  validates :total, presence: true

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
