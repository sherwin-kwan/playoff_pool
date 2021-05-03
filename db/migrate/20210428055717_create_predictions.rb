class CreatePredictions < ActiveRecord::Migration[6.0]
  def change
    create_table :predictions do |t|
      t.references :winner
      t.integer :games
      t.references :user
      t.references :series
      t.timestamps
    end
  end
end
