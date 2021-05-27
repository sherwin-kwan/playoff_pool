class Team < ApplicationRecord
  has_many :series
  belongs_to :division
  validates :name, uniqueness: true
  validates :short_name, uniqueness: true

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

  def nhl_api_team
    # Needs refactor: the singleton methods on NHL::Team don't play well with Marshal
    # Rails.cache.fetch(short_name, :expires => 7.days) do 
    NHL::Team.find_short_name(short_name)
    # end
  end

  def nhl_id
    nhl_api_team.id
  end

  def venue_name
    nhl_api_team.venue_name
  end

  def logo_src
    nhl_api_team.image
  end
end
