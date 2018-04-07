class CreateArticlesTagsJoin < ActiveRecord::Migration[5.1]
  def change
    create_table :articles_tags do |t|
      t.bigint :article_id
      t.bigint :tag_id
    end
    add_index("articles_tags", "article_id")
    add_index("articles_tags", "tag_id")
  end
end
