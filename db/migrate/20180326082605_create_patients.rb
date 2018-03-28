class CreatePatients < ActiveRecord::Migration[5.1]
  def change
    create_table :patients do |t|
      t.string :name, null: false
      t.text :address
      t.string :phone
      t.string :pob
      t.date :dob
      t.string :gender
      t.string :blood_type
      t.string :picture
      t.text :description
      t.string :disease_type
      t.integer :status, null: false
      t.references :village, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index("patients", "name")
  end
end
