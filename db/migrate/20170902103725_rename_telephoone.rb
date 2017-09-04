class RenameTelephoone < ActiveRecord::Migration[5.0]
  def change
    rename_column :contact_details, :telephoone, :telephone
  end
end
