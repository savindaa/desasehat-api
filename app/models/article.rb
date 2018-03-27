class Article < ApplicationRecord

  # image uploader
  mount_base64_uploader :picture, PictureUploader

  # model Association
  belongs_to :admin

  # model Validation
  validates :title, presence: true
  validates :content, presence: true

end
