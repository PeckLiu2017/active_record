class AddClientIdToOrder < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :client_id, :integer
    add_index :orders, :client_id
  end
end
