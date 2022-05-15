class Series < ApplicationRecord
  belongs_to :round
  belongs_to :team1, class_name: "Team"
  belongs_to :team2, class_name: "Team"
  has_many :predictions
  belongs_to :conn_smythe, class_name: "Player", required: false
  belongs_to :winner, class_name: "Team", required: false

  validate :team_doesnt_play_itself
  enum status: %i[active trash] 

  after_save :refresh_ranks

  def refresh_scores
    User.with_picks.each{|u| u.calculate_score}
  end

  # Validation methods
  def team_doesnt_play_itself
    if self.team1 == self.team2
      errors.add(:team1, "Team can't play itself!")
    end
  end

  def active_predictions
    self.predictions.sort_by(&:score).reverse
  end

  # Helper to make the dropdown select easier
  def teams
    [self.team1, self.team2]
  end

  def summary
    if self.winner_id
      "#{self.winner.short_name} in #{self.games}" 
    else
      "TBD"
    end
  end

  def status
    if self.start_time == nil || self.start_time > Time.now
      :upcoming
    elsif self.winner_id == nil
      :ongoing
    else
      :completed
    end
  end

  def user_has_prediction?(user_id)
    User.find(user_id).has_prediction_for?(self)
  end

  def start_time_formatted
    time_zone = ActiveSupport::TimeZone.new(ENV["TIME_ZONE"]) 
    return self.start_time ? (time_zone ? self.start_time.in_time_zone(time_zone).strftime("%F at %H:%M") : self.start_time.strftime("%F at %H:%M")) : "Not available"
  end

end
