class CreateAssembliesPartsJoinTable < ActiveRecord::Migration[5.0]
  def change
    create_join_table :assemblies, :parts do |t|
      t.integer :assembly_id
      t.integer :part_id
    end
  end
end
