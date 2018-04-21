class Article < ApplicationRecord
  require 'uri'

  # image uploader
  mount_base64_uploader :picture, PictureUploader

  # model Association
  belongs_to :creator, foreign_key: :created_by_id, class_name: 'User'

  has_many :article_bookmarks, dependent: :destroy
  has_many :bookmarked_by, through: :article_bookmarks, source: :user, dependent: :destroy

  has_one :article_message

  has_and_belongs_to_many :tags

  # model Validation
  validates :title, presence: true
  validates :content, presence: true
  validates :status, presence: true

  enum status: [ :pending, :accepted, :declined ]

  def created_by
    {
      id: self.creator.id,
      name: self.creator.name,
      picture: self.creator.picture
    }
  end

  def pictures
    if self[:picture].blank?
      { url: nil } 
    else
      { url: self.picture.url } 
    end
  end

  attribute :tags

end
