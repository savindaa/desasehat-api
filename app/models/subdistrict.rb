class Subdistrict < ApplicationRecord
  belongs_to :regency
  has_many :villages
  accepts_nested_attributes_for :villages

  validates :kecamatan, presence: :true
end
