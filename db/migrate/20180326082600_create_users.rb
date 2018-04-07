class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :phone, null: false
      t.string :name, null: false
      t.string :gender
      t.text :address
      t.string :pob
      t.string :dob
      t.string :email
      t.string :occupation
      t.string :picture
      t.references :village, foreign_key: true

      t.timestamps
    end
    add_index("users", "phone")
    add_index("users", "name")
  end
end
