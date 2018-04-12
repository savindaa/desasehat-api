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
      t.text :description
      t.integer :status, null: false
      t.bigint :disease_type_id
      t.references :village, foreign_key: true
      t.bigint :inputted_by_id
      t.bigint :validated_by_id

      t.timestamps
    end
    add_index("patients", "name")
    add_index("patients", "disease_type_id")
    add_index("patients", "validated_by_id")
    add_index("patients", "inputted_by_id")
  end
end
