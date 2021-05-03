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

end
