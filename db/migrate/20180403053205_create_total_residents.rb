class CreateTotalResidents < ActiveRecord::Migration[5.1]
  def change
    create_table :total_residents do |t|
      t.bigint :total
      t.references :village, foreign_key: true

      t.timestamps
    end
  end
end
