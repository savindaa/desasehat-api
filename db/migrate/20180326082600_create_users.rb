class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :phone, null: false
      t.string :name, null: false
      t.text :address
      t.string :picture
      t.text :bio
      t.text :weblink
      t.references :village, foreign_key: true

      t.timestamps
    end
    add_index("users", "phone")
    add_index("users", "name")
  end
end
