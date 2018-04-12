class Subdistrict < ApplicationRecord

  belongs_to :regency
  has_many :villages, dependent: :restrict_with_exception

  validates :kecamatan, presence: :true

end
