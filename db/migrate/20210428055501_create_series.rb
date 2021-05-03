class CreateSeries < ActiveRecord::Migration[6.0]
  def change
    create_table :series do |t|
      t.references :team1 
      t.references :team2
      t.references :winner
      t.integer :games
      t.references :round
      t.timestamps
    end
  end
end
