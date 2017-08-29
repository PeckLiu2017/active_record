class CreateAccounthistroys < ActiveRecord::Migration[5.0]
  def change
    create_table :accounthistroys do |t|
      t.string :order
      t.datetime :order_date
      t.integer :account_id

      t.timestamps
    end
    add_index :accounthistroys, :account_id
  end
end
