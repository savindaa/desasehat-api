class PatientPicture < ApplicationRecord
  
  # image uploader
  mount_base64_uploader :picture, PictureUploader

  belongs_to :patient

end
