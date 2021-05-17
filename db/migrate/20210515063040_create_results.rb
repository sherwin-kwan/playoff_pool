class CreateResults < ActiveRecord::Migration[6.0]
  def change
    create_table :results do |t|
      t.references :user
      t.integer :year
      t.integer :correct 
      t.integer :incorrect
      t.integer :points
      t.integer :lower_seed_correct
      t.timestamps
    end
  end
end
