class CreateArticleMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :article_messages do |t|
      t.text :message
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
