class AddSubdomainToAccount < ActiveRecord::Migration[5.0]
  def change
    add_column :accounts, :subdomain, :string
  end
end
