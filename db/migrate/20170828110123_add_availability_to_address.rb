class AddAvailabilityToAddress < ActiveRecord::Migration[5.0]
  def change
    add_column :addresses, :availability, :integer
  end
end
