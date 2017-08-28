class AddLockVersionToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :lock_version, :integer
  end
end
