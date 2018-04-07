class CreateUserPrivileges < ActiveRecord::Migration[5.1]
  def change
    create_table :user_privileges, id: false do |t|
      t.bigint :user_id
      t.bigint :privilege_id
    end
    add_index("user_privileges", "user_id")
    add_index("user_privileges", "privilege_id")
  end
end
