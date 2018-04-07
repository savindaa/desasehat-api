class Regency < ApplicationRecord
  belongs_to :province
  has_many :subdistricts
  accepts_nested_attributes_for :subdistricts

  validates :kabupaten, presence: :true

  def list_kecamatan
    self.subdistricts.as_json(only: [:id, :kecamatan])
  end

end
