class Team < ApplicationRecord
  has_many :series
  belongs_to :division

  def lineup_url
    "https://www.dailyfaceoff.com/teams/#{self.daily_faceoff_slug}/line-combinations"
  end

  def daily_faceoff_slug
    if self.name.include? "Canadiens"
      "montreal-canadiens"
    else
      self.name.downcase.gsub(" ", "-")
    end
  end
end
