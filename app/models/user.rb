require_relative '../../lib/assets/scoring.rb'

class User < ApplicationRecord
  has_many :predictions
  has_many :results

  before_create :lowercase_email
  before_validation :lowercase_email
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "Must be a valid email format" }
  validates :password, length: { minimum: 5 }
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

  # Scoring related

  def score
    self.predictions.map(&:score).reduce(0, :+)
  end

  def score_with_tiebreaker
    self.score + self.correct_predictions * 0.01 + self.correct_lower_seed_picks * 0.0001
  end

  def correct_predictions
    self.predictions.filter(&:active?).filter(&:correct_winner?).count
  end

  def correct_lower_seed_picks
    self.predictions.filter(&:correct_winner?).filter(&:lower_seed_pick?).count
  end

  def rank(year = Time.now.year) # Note: doesn't deal with ties yet
    User.all.filter{|u| (u.score_with_tiebreaker - self.score_with_tiebreaker) > 0}.count + 1
    # Scoring.ranked_players(year).find_index{|user| user == self} + 1
  end

  def has_prediction_for?(series)
    self.predictions.find_by(series: series) ? true : false
  end

  def with_picks?(year = Time.now.year)
    Series.where(year: year).filter{|ser| ser.user_has_prediction?(self.id)}.count > 0
  end

end
