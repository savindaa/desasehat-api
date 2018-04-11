class CreatePatientMessages < ActiveRecord::Migration[5.1]
  def change
    create_table :patient_messages do |t|
      t.text :message
      t.references :patient, foreign_key: true

      t.timestamps
    end
  end
end
