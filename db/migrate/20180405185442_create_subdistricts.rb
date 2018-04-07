class CreateSubdistricts < ActiveRecord::Migration[5.1]
  def change
    create_table :subdistricts do |t|
      t.string :kecamatan
      t.references :regency, foreign_key: true

      t.timestamps
    end
    add_index("subdistricts", "kecamatan")
  end
end
