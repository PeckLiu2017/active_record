class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.integer :supplier_id
      t.string :account_number

      t.timestamps
    end
    add_index :accounts, :supplier_id, unique: true
  end
end
