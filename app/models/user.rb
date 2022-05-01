
class User < ApplicationRecord
  has_many :predictions
  has_many :results

  before_create :lowercase_email
  before_validation :lowercase_email
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be a valid email format" }
  validates_confirmation_of :password

  enum privilege: [:regular, :admin]

  # Authentication related

  def lowercase_email
    self.email = self.email.strip.downcase if self.email
  end

  def self.authenticate_with_email(email, password)
    user = User.find_by(email: email.strip.downcase)
    return user if user&.authenticate(password)
  end

  # Scoring related - For years before 2021, these are looked up from the results table created by seed_old_results instead of from the live app

  def old_result!(year)
    self.results.find_by(year: year)
  end

  def score(year = Time.now.year)
    if year >= 2021
      self.predictions.map(&:score).reduce(0, :+)
    else
      self.old_result!(year)&.points
    end
  end

  def correct_predictions(year = Time.now.year)
    if year >= 2021
      self.predictions.filter(&:correct_winner?).count
    else
      self.old_result!(year)&.correct 
    end
  end

  def correct_lower_seed_picks(year = Time.now.year)
    if year >= 2021
      self.predictions.filter(&:correct_winner?).filter(&:lower_seed_pick?).count
    else
      self.old_result!(year)&.lower_seed_correct
    end
  end

  def score_with_tiebreaker(year)
    begin
      self.score(year) + self.correct_predictions(year) * 0.01 + self.correct_lower_seed_picks(year) * 0.0001
      # If the user did not participate in a certain year, then these values will be nil. Return -99 to signify this error
    rescue NoMethodError 
      -99
    end
  end

  def rank(year = Time.now.year) 
      User.all.filter{|u| (u.score_with_tiebreaker(year) - self.score_with_tiebreaker(year)) > 0}.count + 1
    # Scoring.ranked_players(year).find_index{|user| user == self} + 1
  end

  def has_prediction_for?(series)
    self.predictions.find_by(series: series) ? true : false
  end

  def has_picks?(year = Time.now.year)
    Series.where(year: year).filter{|ser| ser.user_has_prediction?(self.id)}.count > 0
  end

  def years_in_pool
    self.results.count + (self.has_picks? ? 1 : 0)
  end

  def most_recent_active_year
    if self.has_picks?
      Time.now.year
    else
      self.results.map(&:year).max
    end
  end

end
