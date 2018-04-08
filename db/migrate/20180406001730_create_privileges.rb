class CreatePrivileges < ActiveRecord::Migration[5.1]
  def change
    create_table :privileges do |t|
      t.string :name
      t.boolean :su_only, default: false

      t.timestamps
    end
  end
end
