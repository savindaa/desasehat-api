class Privilege < ApplicationRecord

  has_many :user_privileges, dependent: :restrict_with_exception
  has_many :users, through: :user_privileges, dependent: :restrict_with_exception

end
