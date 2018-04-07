class CreateProvinces < ActiveRecord::Migration[5.1]
  def change
    create_table :provinces do |t|
      t.string :provinsi

      t.timestamps
    end
  end
end
