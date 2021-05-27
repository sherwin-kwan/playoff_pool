class Prediction < ApplicationRecord
  belongs_to :user
  belongs_to :series
  belongs_to :winner, class_name: "Team"

  validate :predict_before_series

  def correct_winner?
    self.winner_id == self.series.winner_id
  end

  def correct_games?
    self.games == self.series.games
  end

  def lower_seed_pick?
    self.winner_id == self.series.team2_id
  end

  def score # Does not yet account for MVP bonus
    if self.correct_winner?
      if self.correct_games?
        return self.series.round.base_score * 2
      else
        return self.series.round.base_score
      end
    end
    0
  end

  def summary
    "#{self.winner.short_name} in #{self.games}"
  end

  private
  def predict_before_series 
    if self.series.start_time && self.series.start_time < Time.now
      errors.add(:winner_id, "Cannot make a prediction after the series has started")
    end
  end
end
