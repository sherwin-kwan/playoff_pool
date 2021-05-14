class Scoring

  def self.leader
    self.ranked_players[0]
  end

  def self.ranked_players
    User.all.sort_by{|u| u.score + u.correct_predictions * 0.01 + u.correct_lower_seed_picks * 0.0001}.reverse
  end
end