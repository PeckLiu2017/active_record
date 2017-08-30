class AddBooksUpdatedAtToAuthors < ActiveRecord::Migration[5.0]
  def change
    add_column :authors, :books_updated_at, :datetime
  end
end
