class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :phone, null: false
      t.string :name, null: false
      t.string :gender
      t.text :address
      t.string :nik
      t.string :email
      t.string :user_job
      t.string :picture
      t.integer :role, null: false
      t.string :otp, limit: 4
      t.references :village, foreign_key: true

      t.timestamps
    end
    add_index("users", "phone")
    add_index("users", "name")
  end
end
