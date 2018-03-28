class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :picture, :created_at

  def created_at
    object.created_at.strftime "%d-%m-%Y"
  end
end
