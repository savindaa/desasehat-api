class CreateResidents < ActiveRecord::Migration[5.1]
  def change
    create_table :residents do |t|
      t.date :input_date, null:false
      t.string :input_type, null: false
      t.string :disease_type
      t.integer :total, null: false, default: 0
      t.references :village, foreign_key: true

      t.timestamps
    end
    add_index("residents", "input_date")

  end
end
