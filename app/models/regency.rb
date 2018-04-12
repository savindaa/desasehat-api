class Regency < ApplicationRecord

  belongs_to :province
  has_many :subdistricts, dependent: :restrict_with_exception

  validates :kabupaten, presence: :true

end
