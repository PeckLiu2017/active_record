class AddPartIdToAssemblies < ActiveRecord::Migration[5.0]
  def change
    add_column :assemblies, :part_id, :integer
    add_index :assemblies, :part_id
  end
end
