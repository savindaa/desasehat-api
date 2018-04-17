class User < ApplicationRecord

  # image uploader
  mount_base64_uploader :picture, PictureUploader

  # model Association
  belongs_to :village

  has_one :verification
  has_many :inputs, foreign_key: :inputted_by_id, class_name: 'Patient', dependent: :nullify
  has_many :validates, foreign_key: :validated_by_id, class_name: 'Patient', dependent: :nullify
  has_many :articles, foreign_key: :created_by_id, dependent: :nullify

  # m:m privileges
  has_many :user_privileges, dependent: :destroy
  has_many :privileges, through: :user_privileges, dependent: :destroy
  # m:m bookmarks
  has_many :article_bookmarks, dependent: :destroy
  has_many :bookmarks, through: :article_bookmarks, source: :article, dependent: :destroy

  # model Validation
  validates :phone, presence: true,
                    uniqueness: true, case_sensitive: false
  validates :name, presence: true
  # scope
  scope :exclude_current_user, ->(user) { where.not(id: user).order(:name) }

  # JSON output
  def user_privileges
    self.privileges.as_json(only: [:id, :name])
  end

  def picture
    { url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSlMNPszBzrblPa1wEIpULUqm9W2tDJpDL6lcz5cr6yZSpBjiVhTw" } if self[:picture].blank?
  end

end
