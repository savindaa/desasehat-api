class ArticleSerializer < ActiveModel::Serializer

  attributes :id, :title, :content, :picture

  attribute :created_at do
    object.created_at.strftime "%d-%m-%Y"
  end

  attribute :created_by do
    object.admin.name
  end
end
