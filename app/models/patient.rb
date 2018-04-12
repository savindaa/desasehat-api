class Patient < ApplicationRecord

  # model Association
  has_one :patient_message  

  has_many :patient_pictures, dependent: :destroy

  belongs_to :village
  belongs_to :disease_type

  belongs_to :inputter, class_name: 'User', foreign_key: :inputted_by_id
  belongs_to :validator, class_name: 'User', optional: true, foreign_key: :validated_by_id

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

  def pictures
    if !self.patient_pictures.blank?
      self.patient_pictures.map do |pict|
        pict.picture
      end
    else
      { url: PictureUploader.default_url }
    end
  end

  def picture
    if !self.patient_pictures.blank?
      self.patient_pictures.first.picture
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

  def inputted_by
    {
      id: self.inputter.id,
      name: self.inputter.name,
      picture: self.inputter.picture
    }
  end

  def validated_by
    {
      id: self.validator.id,
      name: self.validator.name,
      picture: self.validator.picture
    } unless self.validator.blank?
  end
end
