class Admin < ApplicationRecord

  has_secure_password

  # model Validation
  validates :username, presence: true,
                       uniqueness: true
  validates :password, presence: true,
                       confirmation: true,
                       length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :name, presence: true
  
end
