class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.string :gender
      t.integer :user_id, index: true 
      t.timestamps
    end
  end
end
