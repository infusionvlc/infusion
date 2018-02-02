class AddRoleIdToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :role_id, :integer, default: 1
  end
end
