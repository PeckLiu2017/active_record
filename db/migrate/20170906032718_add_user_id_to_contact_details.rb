class AddUserIdToContactDetails < ActiveRecord::Migration[5.0]
  def change
    add_column :contact_details, :user_id, :integer
    add_index :contact_details, :user_id
  end
end
