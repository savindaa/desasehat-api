class CreatePatientPictures < ActiveRecord::Migration[5.1]
  def change
    create_table :patient_pictures do |t|
      t.references :patient, foreign_key: true
      t.string :picture

      t.timestamps
    end
  end
end
