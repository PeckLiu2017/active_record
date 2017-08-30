class AddActiveToAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :active, :boolean
  end
end
