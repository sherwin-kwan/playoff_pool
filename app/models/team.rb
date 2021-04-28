class Team < ApplicationRecord
  has_many :series
  belongs_to :division
end
