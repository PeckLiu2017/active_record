class AddTimeZoneToPeople < ActiveRecord::Migration[5.0]
  def change
    add_column :people, :time_zone, :string
  end
end
