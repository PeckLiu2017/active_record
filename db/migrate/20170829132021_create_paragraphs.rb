class CreateParagraphs < ActiveRecord::Migration[5.0]
  def change
    create_table :paragraphs do |t|
      t.text :content
      t.integer :section_id

      t.timestamps
    end
    add_index :paragraphs, :section_id
  end
end
