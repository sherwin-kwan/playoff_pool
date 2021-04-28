class Prediction < ApplicationRecord
  belongs_to :user
  belongs_to :series
end
