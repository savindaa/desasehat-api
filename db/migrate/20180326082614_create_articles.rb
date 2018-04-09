class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :content
      t.string :picture
      t.integer :status, null: false
      t.bigint :created_by_id

      t.timestamps
    end
    add_index("articles", "title")
    add_index("articles", "created_by_id")
  end
end
