class DiseaseType < ApplicationRecord

  has_many :patient, dependent: :restrict_with_exception

end
