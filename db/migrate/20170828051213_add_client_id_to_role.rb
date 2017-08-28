class AddClientIdToRole < ActiveRecord::Migration[5.0]
  def change
    add_column :roles, :client_id, :integer
  end
end
