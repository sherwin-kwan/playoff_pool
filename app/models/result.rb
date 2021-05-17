class Result < ApplicationRecord
  belongs_to :user

  def points_with_tiebreaker
    self.points + self.correct * 0.01 + self.lower_seed_correct * 0.0001
  end
end
