class Prediction < ApplicationRecord
  belongs_to :user
  belongs_to :series
  belongs_to :winner, class_name: "Team"
  belongs_to :conn_smythe, class_name: "Player", required: false

  validate :predict_before_series
  validates :series, uniqueness: { scope: :user }
  validates :conn_smythe_id, presence: true, :if => Proc.new{|p| p.series.round.round == 4}
  validates :conn_smythe_id, presence: false, :if => Proc.new{|p| p.series.round.round != 4}

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
    sc = 0
    if self.correct_winner?
      if self.correct_games?
        sc = self.series.round.base_score * 2
      else
        sc = self.series.round.base_score
      end
    end
    return self.conn_smythe && (self.conn_smythe == self.series.conn_smythe) ? sc + 2 : sc
  end

  def summary
    return self.conn_smythe_id ? "#{self.winner.short_name} in #{self.games}, #{self.conn_smythe.name}" : "#{self.winner.short_name} in #{self.games}"
  end

  private
  def predict_before_series 
    if self.series.start_time && self.series.start_time < Time.now
      errors.add(:winner_id, "Cannot make a prediction after the series has started")
    end
  end
end
