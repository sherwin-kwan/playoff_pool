class User < ApplicationRecord
  has_many :predictions

  def score
    self.predictions.reduce(&:score)
  end
end
