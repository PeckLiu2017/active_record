class RenameTelephoneInContactDetails < ActiveRecord::Migration[5.0]
  def change
    rename_column :contact_details, :telephone, :telephones
  end
end
