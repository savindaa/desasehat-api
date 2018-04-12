class CreateVillages < ActiveRecord::Migration[5.1]
  def change
    create_table :villages do |t|
      t.string :kelurahan
      t.string :kodepos
      t.text :description
      t.bigint :subdistrict_id

      t.timestamps
    end
    add_index("villages", "subdistrict_id")
    add_index("villages", "kelurahan")
  end
end
