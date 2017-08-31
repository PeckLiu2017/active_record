class CreatePlayers < ActiveRecord::Migration[5.0]
  def change
    create_table :players do |t|
      t.string :points
      t.string :games_played

      t.timestamps
    end
  end
end
