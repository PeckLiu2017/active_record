class AddBioToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :bio, :string
  end
end
