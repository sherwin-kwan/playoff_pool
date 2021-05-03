class Scoring

  def self.leader
    self.ranked_players[0]
  end

  def self.ranked_players
    User.all.sort_by(&:score).reverse
  end
end