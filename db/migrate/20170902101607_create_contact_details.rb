class CreateContactDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :contact_details do |t|
      t.string :telephoone
      t.string :email
      t.string :wechat
      t.integer :person_id

      t.timestamps
    end
  end
end
