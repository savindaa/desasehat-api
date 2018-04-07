class CreateArticlePictures < ActiveRecord::Migration[5.1]
  def change
    create_table :article_pictures do |t|
      t.references :article, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
