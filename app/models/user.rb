class User < ApplicationRecord

  # model Association
  belongs_to :village

  has_one :verification
  has_many :inputs, foreign_key: :inputted_by_id, class_name: 'Patient'
  has_many :validates, foreign_key: :validated_by_id, class_name: 'Patient'
  has_many :articles

  # m:m privileges
  has_many :user_privileges
  has_many :privileges, through: :user_privileges
  # m:m bookmarks
  has_many :article_bookmarks
  has_many :bookmarks, through: :article_bookmarks, source: :article

  # model Validation
  validates :phone, presence: true,
                    uniqueness: true, case_sensitive: false
  validates :name, presence: true
  validates :gender, presence: true
  validates :email, format: { with: EMAIL_REGEX },
                    allow_blank: true

  # scope
  scope :exclude_current_user, ->(user) { where.not(id: user).order(:name) }

  def user_privileges
    self.privileges.as_json(only: [:id, :privilege_name])
  end

end
