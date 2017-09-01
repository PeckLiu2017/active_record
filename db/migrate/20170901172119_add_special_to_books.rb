class AddSpecialToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :special, :boolean
  end
end
