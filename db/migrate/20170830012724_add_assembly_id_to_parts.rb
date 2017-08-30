class AddAssemblyIdToParts < ActiveRecord::Migration[5.0]
  def change
    add_column :parts, :assembly_id, :integer
    add_index :parts, :assembly_id
  end
end
