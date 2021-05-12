require_relative '../../lib/assets/scoring.rb'

class User < ApplicationRecord
  has_many :predictions

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

  def correct_predictions
    self.predictions.filter(&:active?).filter(&:correct_winner?).count
  end

  def correct_lower_seed_picks
    self.predictions.filter(&:correct_winner?).filter(&:lower_seed_pick?).count
  end

  def rank # Note: doesn't deal with ties yet
    Scoring.ranked_players.find_index{|user| user == self} + 1
  end

end
