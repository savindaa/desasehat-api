class Admin < ApplicationRecord

  has_secure_password

  # model Association
  belongs_to :village, { :optional => true }
  has_many :articles

  # model Validation
  validates :username, presence: true,
                       uniqueness: true, unless: Proc.new { |b| b.username.blank? }
  validates :password, presence: true,
                       confirmation: true,
                       length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :name, presence: true
  validates :nik, uniqueness: true, unless: Proc.new { |b| b.nik.blank? }
  validates :phone, uniqueness: true, unless: Proc.new { |b| b.phone.blank? }
  validates :email, format: { with: EMAIL_REGEX },
                    allow_blank: true
  validates :role, presence: true

  # enum on role
  enum role: [ :super_admin, :aparat_desa, :admin_edukasi ]

end
