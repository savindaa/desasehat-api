class CreateDonations < ActiveRecord::Migration[5.1]
  def up
    create_table :donations do |t|
      t.string :phone
      t.string :name
      t.bigint :amount
      t.integer :unique_code
      t.string :payment_options
      t.text :comment
      t.references :patient, foreign_key: true
      t.integer :status
      t.string :picture

      t.timestamps
    end
    execute("ALTER SEQUENCE donations_id_seq RESTART 10000;")
  end

  def down
    drop_table("donations")
  end
end
