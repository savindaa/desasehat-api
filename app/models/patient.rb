class Patient < ApplicationRecord

  # model Association
  has_many :patient_pictures

  belongs_to :village
  belongs_to :disease_type

  belongs_to :inputted_by, class_name: 'User'
  belongs_to :validated_by, class_name: 'User', optional: true


  # model Validation
  validates :name, :dob, :gender, :disease_type, :status, :blood_type, presence: true

  # enum on status
  enum status: [ :draft, :pending, :accepted, :declined, :cured ]

  attribute :age

  def age
    ((Time.zone.now - self[:dob].to_time) / 1.year.seconds).floor
  end

  def user_id
    {
      id: self.user.id,
      name: self.user.name
    }
  end

  def village_id
    {
      id: self.village.id,
      name: self.village.name,
      kecamatan: self.village.kecamatan,
      kabupaten: self.village.kabupaten,
      provinsi: self.village.provinsi
    }
  end

  def dob
    self[:dob].strftime "%d-%m-%Y" unless self[:dob].blank?
  end
end
