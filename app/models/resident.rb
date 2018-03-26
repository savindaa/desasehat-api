class Resident < ApplicationRecord

  # model Association
  belongs_to :village

  # model Validation
  validates :date, :type, :total, presence: true

  # enum on type
  enum type: [ :penduduk_sehat, :penduduk_sakit ]

end
