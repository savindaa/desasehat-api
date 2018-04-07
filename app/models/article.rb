class Article < ApplicationRecord

  # model Association
  belongs_to :user

  has_many :article_pictures

  has_many :article_bookmarks
  has_many :bookmarked_by, through: :article_bookmarks, source: :user

  has_and_belongs_to_many :tags

  # model Validation
  validates :title, presence: true
  validates :content, presence: true

  def admin_id
    {
      id: self.admin.id,
      name: self.admin.name
    }
  end

end
