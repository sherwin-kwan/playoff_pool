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

  def playoff_schedule
    @schedule = NHL::Game.playoff_schedule(Time.now.year, self.nhl_id)
    @schedule.map do |game|
      Game.new(game, self)
    end
  end

  def nhl_id
    NHL::Team.find_short_name(self.short_name).id
  end

  def venue_name
    NHL::Team.find_short_name(self.short_name).venue_name
  end

  def logo_src
    NHL::Team.find(self.nhl_id).image
  end
end
