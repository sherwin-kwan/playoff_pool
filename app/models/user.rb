class User < ApplicationRecord
  has_many :predictions

  def score
    self.predictions.map(&:score).reduce(&:+)
  end

  def correct_predictions
    self.predictions.map(&:correct_winner?).filter(&:present?).count
  end
end
