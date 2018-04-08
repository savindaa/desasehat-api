class Patient < ApplicationRecord

  # model Association
  has_many :patient_pictures

  belongs_to :village
  belongs_to :disease_type

  belongs_to :inputted_by, class_name: 'User'
  belongs_to :validated_by, class_name: 'User', optional: true

  attr_accessor :pictures

  # model Validation
  validates :name, :dob, :gender, :status, :blood_type, presence: true

  # enum on status
  enum status: [ :pending, :accepted, :declined, :cured ]

  attribute :age

  def disease
    {
      id: self.disease_type.id,
      name: self.disease_type.name
    }
  end

  def picture
    if !self.patient_pictures.blank?
      self.patient_pictures.map do |pict|
        pict.p
      end
    else
      { url: PictureUploader.default_url }
    end
  end

  def age
    ((Time.zone.now - self[:dob].to_time) / 1.year.seconds).floor
  end

  def village_id
    {
      id: self.village.id,
      kelurahan: self.village.kelurahan,
      kecamatan: self.village.kecamatan,
      kabupaten: self.village.kabupaten,
      provinsi: self.village.provinsi
    }
  end

  def dob
    self[:dob].strftime "%d-%m-%Y" unless self[:dob].blank?
  end

  def inputted_by_id
    {
      id: self.inputted_by.id,
      name: self.inputted_by.name,
      picture: self.inputted_by.picture
    }
  end

  def validated_by_id
    {
      id: self.validated_by.id,
      name: self.validated_by.name,
      picture: self.validated_by.picture
    } unless self.validated_by.blank?
  end
end
