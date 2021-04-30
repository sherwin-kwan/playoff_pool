class User < ApplicationRecord
  has_many :predictions

  def score
    self.predictions.map(&:score).reduce(&:+)
  end
end
