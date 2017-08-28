class AddOrdersCountToClient < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :orders_count, :string
  end
end
