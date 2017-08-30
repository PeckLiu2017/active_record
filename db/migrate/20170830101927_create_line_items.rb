class CreateLineItems < ActiveRecord::Migration[5.0]
  def change
    create_table :line_items do |t|
      t.text :content
      t.integer :book_id

      t.timestamps
    end
    add_index :line_items, :book_id
  end
end
