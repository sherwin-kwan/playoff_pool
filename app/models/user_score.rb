class UserScore < ActiveRecord::Base
  belongs_to :user

  validates :year, presence: true
end