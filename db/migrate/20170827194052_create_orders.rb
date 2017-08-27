class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      t.string :product
      t.string :price
      t.string :quantity
      t.string :total_price

      t.timestamps
    end
  end
end
