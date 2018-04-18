class CreatePaymentOptions < ActiveRecord::Migration[5.1]
  def change
    create_table :payment_options do |t|
      t.string "name"
      t.string "account_number"

      t.timestamps
    end
  end
end
