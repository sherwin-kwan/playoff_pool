class Series < ApplicationRecord
  belongs_to :round
  belongs_to :team1, class_name: "Team"
  belongs_to :team2, class_name: "Team"
  has_many :predictions
  belongs_to :winner, class_name: "Team"
end
