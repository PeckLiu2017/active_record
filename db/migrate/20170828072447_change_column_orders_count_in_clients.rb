class ChangeColumnOrdersCountInClients < ActiveRecord::Migration[5.0]
  def change
    change_column :clients, :orders_count, :integer
  end
end
