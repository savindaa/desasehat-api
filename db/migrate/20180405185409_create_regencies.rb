class CreateRegencies < ActiveRecord::Migration[5.1]
  def change
    create_table :regencies do |t|
      t.string :kabupaten
      t.references :province, foreign_key: true

      t.timestamps
    end
  end
end
