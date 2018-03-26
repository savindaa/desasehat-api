class Article < ApplicationRecord

  # model Association
  belongs_to :admin

  # model Validation
  validates :title, presence: true
  validates :content, presence: true

end
