class Province < ApplicationRecord
  has_many :regencies
  accepts_nested_attributes_for :regencies
  validates :provinsi, presence: :true

  def list_kabupaten
    self.regencies.as_json(only: [:id, :kabupaten])
  end

end
