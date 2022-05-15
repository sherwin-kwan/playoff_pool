class CreateUserScores < ActiveRecord::Migration[7.0]
  def change
    create_table :user_scores do |t|
      t.references :user
      t.integer :year
      t.integer :score
    end
  end
end
