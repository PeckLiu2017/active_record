class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.references :manager, index: true
      t.timestamps
    end
  end
end
