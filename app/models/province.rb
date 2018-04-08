class Province < ApplicationRecord

  has_many :regencies, dependent: :restrict_with_exception
  validates :provinsi, presence: :true

end
