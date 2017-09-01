class AddChangeColumnInBooks < ActiveRecord::Migration[5.0]
  def change
    rename_column :books, :name, :title
    add_column :books, :content, :string
  end
end
