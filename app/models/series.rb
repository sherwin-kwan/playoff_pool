class Series < ApplicationRecord
  belongs_to :round
  belongs_to :team1, class_name: "Team"
  belongs_to :team2, class_name: "Team"
  has_many :predictions
  belongs_to :winner, class_name: "Team", required: false

  validate :team_doesnt_play_itself
  validate :series_within_division

  enum status: %i[active trash] 

  # Validation methods
  def team_doesnt_play_itself
    if self.team1 == self.team2
      errors.add(:team1, "Team can't play itself!")
    end
  end

  def series_within_division
    if (self.team1.division != self.team2.division) && self.round.fancy_name.include?("Division")
      errors.add(:team1, "Division series must be played within teams of the same division")
    end
  end

  def active_predictions
    self.predictions.filter(&:active?)
  end

  # Helper to make the dropdown select easier
  def teams
    [self.team1, self.team2]
  end

end
