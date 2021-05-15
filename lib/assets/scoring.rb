class Scoring

  def self.leader(year = Time.now.year)
    self.ranked_players(year)[0]
  end

  def self.ranked_players(year = Time.now.year)
    User.all.filter{|u| u.with_picks?(year)}.sort_by{|u| u.score_with_tiebreaker}.reverse
  end
end