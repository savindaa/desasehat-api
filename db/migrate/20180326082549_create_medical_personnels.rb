class CreateMedicalPersonnels < ActiveRecord::Migration[5.1]
  def change
    create_table :medical_personnels do |t|
      t.string :name, null: false
      t.string :position
      t.string :phone
      t.string :agency
      t.references :village, foreign_key: true

      t.timestamps
    end
    add_index("medical_personnels", "name")
  end
end
