class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.string :country
      t.string :province
      t.string :city
      t.string :county

      t.timestamps
    end
  end
end
