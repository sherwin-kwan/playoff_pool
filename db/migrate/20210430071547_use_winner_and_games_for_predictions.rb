class UseWinnerAndGamesForPredictions < ActiveRecord::Migration[6.0]
  def change
    remove_column :predictions, :team1_prediction, if_exists: true
    remove_column :predictions, :team2_prediction, if_exists: true
    add_column :predictions, :winner, :boolean
    add_column :predictions, :games, :integer
    remove_column :series, :team1_score, if_exists: true
    remove_column :series, :team2_score, if_exists: true
    add_column :series, :winner, :boolean
    add_column :series, :games, :integer
  end
end
