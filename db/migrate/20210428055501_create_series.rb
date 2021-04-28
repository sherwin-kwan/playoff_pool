class CreateSeries < ActiveRecord::Migration[6.0]
  def change
    create_table :series do |t|
      t.belongs_to :team1 
      t.belongs_to :team2
      t.integer :team1_score
      t.integer :team2_score
      t.references :round
      t.timestamps
    end
  end
end
