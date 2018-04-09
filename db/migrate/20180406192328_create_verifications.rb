class CreateVerifications < ActiveRecord::Migration[5.1]
  def change
    create_table :verifications do |t|
      t.string :code
      t.bigint :user_id
      t.timestamps
    end
    add_index("verifications", "user_id")
  end
end
