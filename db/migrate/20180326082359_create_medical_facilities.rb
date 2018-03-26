class CreateMedicalFacilities < ActiveRecord::Migration[5.1]
  def change
    create_table :medical_facilities do |t|
      t.string :name, null: false
      t.string :facility_type
      t.text :address
      t.string :phone
      t.references :village, foreign_key: true

      t.timestamps
    end
    add_index("medical_facilities", "name")
  end
end
