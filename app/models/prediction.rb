class Prediction < ApplicationRecord
  belongs_to :user
  belongs_to :series
  belongs_to :winner, class_name: "Team"

  def correct_winner?
    self.winner == self.series.winner
  end

  def correct_games? 
    self.games == self.series.games
  end

  def lower_seed_pick?
    self.winner == self.series.team2
  end

  def score # Does not yet account for MVP bonus
    if self.active? && self.correct_winner?
      if self.correct_games?
        return self.series.round.base_score * 2
      else
        return self.series.round.base_score
      end
    end
    0
  end

  def active?
    return false unless self.series.active?
    newer_predictions = Prediction.all.filter{|pred| pred.series_id == self.series_id && pred.user_id == self.user_id && pred.created_at > self.created_at}
    return newer_predictions.count > 0 ? false : true
  end

end
