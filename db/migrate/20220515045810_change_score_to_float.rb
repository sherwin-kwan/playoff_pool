class ChangeScoreToFloat < ActiveRecord::Migration[7.0]
  def up
    change_column :user_scores, :score, :float
    UserScore.all.each{|us| us.user.calculate_score}
  end

  def down
    change_column :user_scores, :score, :integer
    UserScore.all.each{|us| us.score = us.score.to_i}
  end
end
