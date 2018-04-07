class ArticlePicture < ApplicationRecord

  # image uploader
  mount_base64_uploader :picture, PictureUploader

  belongs_to :article
  
end
