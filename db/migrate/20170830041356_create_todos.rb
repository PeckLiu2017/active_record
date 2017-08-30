class CreateTodos < ActiveRecord::Migration[5.0]
  def change
    create_table :todos do |t|
      t.string :event
      t.datetime :schedule
      t.integer :guid
      t.integer :user_id

      t.timestamps
    end
  end
end
