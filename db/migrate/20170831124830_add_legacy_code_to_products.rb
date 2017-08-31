class AddLegacyCodeToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :legacy_code, :string
  end
end
