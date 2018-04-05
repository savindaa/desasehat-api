class User < ApplicationRecord

    # model Association
    belongs_to :village, { :optional => true }
    has_many :patients

    # model Validation
    validates :phone, presence: true,
                      uniqueness: true, case_sensitive: false
    validates :name, presence: true
    validates :role, presence: true
    validates :gender, presence: true
    validates :nik, uniqueness: true, unless: Proc.new { |b| b.nik.blank? }
    validates :email, format: { with: EMAIL_REGEX },
                      allow_blank: true

    # enum on role
    enum role: [ :admin_desa, :umum ]

end
