class CreateRounds < ActiveRecord::Migration[6.0]
  def change
    create_table :rounds do |t|
      t.integer :round
      t.string :fancy_name
      t.integer :special, default: 0
      t.integer :base_score
      t.timestamps
    end
  end
end
