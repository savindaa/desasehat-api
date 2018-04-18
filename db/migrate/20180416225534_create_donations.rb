class CreateDonations < ActiveRecord::Migration[5.1]
  def up
    create_table :donations do |t|
      t.string :phone
      t.string :name
      t.bigint :amount
      t.integer :unique_code
      t.bigint :payment_option_id
      t.text :comment
      t.references :patient, foreign_key: true
      t.integer :status

      t.timestamps
    end
    add_index("donations", "payment_option_id")
    execute("ALTER SEQUENCE donations_id_seq RESTART 10000;")
  end

  def down
    drop_table("donations")
  end
end
