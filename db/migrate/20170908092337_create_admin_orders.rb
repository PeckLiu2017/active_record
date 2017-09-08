class CreateAdminOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :admin_orders do |t|

      t.timestamps
    end
  end
end
