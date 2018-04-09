class DiseaseType < ApplicationRecord

  has_many :patients, dependent: :restrict_with_exception

  validates :name, presence: true

end
