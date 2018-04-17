class Patient < ApplicationRecord

  # model Association
  has_one :patient_message  

  has_many :patient_pictures, dependent: :destroy
  has_many :donations

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
      nil
    end
  end

  def picture
    if !self.patient_pictures.blank?
      self.patient_pictures.first.picture
    else
      nil
    end
  end

  def age
    ((Time.zone.now - self[:dob].to_time) / 1.year.seconds).floor
  end

  def village_id
    {
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

  def donation_status
    if self[:validated_at].blank? || self[:period].blank?
      return "Inactive"
    else
      if self[:validated_at] + self[:period] > Date.today
        return "Active"        
      else
        return "Inactive"                
      end
    end
  end

  def period
    if self[:validated_at].blank? || self[:period].blank?
      return 0
    else
      days_left = (self[:validated_at] + self[:period]) - Date.today
      days_left = 0 if (days_left < 0)
      return days_left.to_i
    end
  end

  def fund_current
    return self[:fund_current].blank? ? 0 : self[:fund_current]
  end

end
