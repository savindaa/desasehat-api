class CreateVillages < ActiveRecord::Migration[5.1]
  def change
    create_table :villages do |t|
      t.string :name
      t.string :kecamatan
      t.string :kabupaten
      t.string :provinsi
      t.text :description

      t.timestamps
    end
  end
end
