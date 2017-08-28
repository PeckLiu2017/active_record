class AddRoleIdToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :role_id, :integer
  end
end
