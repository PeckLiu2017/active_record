class CreateSections < ActiveRecord::Migration[5.0]
  def change
    create_table :sections do |t|
      t.text :content
      t.integer :document_id

      t.timestamps
    end
    add_index :sections, :document_id
  end
end
