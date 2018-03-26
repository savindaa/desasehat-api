class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admins do |t|
      t.string :username, null: false
      t.string :password_digest
      t.string :name, null: false
      t.string :nik
      t.string :phone
      t.string :email
      t.text :address
      t.string :position
      t.integer :role, null: false
      t.references :village, foreign_key: true

      t.timestamps
    end
    add_index("admins", "username")
    add_index("admins", "name")
  end
end
