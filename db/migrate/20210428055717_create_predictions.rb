class CreatePredictions < ActiveRecord::Migration[6.0]
  def change
    create_table :predictions do |t|
      t.integer :team1_prediction
      t.integer :team2_prediction
      t.references :user
      t.references :series
      t.timestamps
    end
  end
end
