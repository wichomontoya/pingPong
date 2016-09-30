class AddColumnToGames < ActiveRecord::Migration[5.0]
  def change
    add_column :games, :type, :string
    add_column :games, :score_player, :integer
    add_column :games, :score_opponent, :integer
  end
end
