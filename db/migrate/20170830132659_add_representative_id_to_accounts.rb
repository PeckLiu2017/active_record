class AddRepresentativeIdToAccounts < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :representative_id, :integer
  end
end
