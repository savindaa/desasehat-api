class CreateArticleBookmarks < ActiveRecord::Migration[5.1]
  def change
    create_table :article_bookmarks do |t|
      t.bigint :user_id
      t.bigint :article_id
    end
    add_index("article_bookmarks", "user_id")
    add_index("article_bookmarks", "article_id")
  end
end
