class CreateDiseaseTypes < ActiveRecord::Migration[5.1]
  def change
    create_table :disease_types do |t|
      t.string :name
      t.boolean :main, default: false

      t.timestamps
    end
  end
end
