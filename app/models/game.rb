class Game
  # Given a game from the NHL API

  attr_accessor :date, :time, :time_raw, :venue_name, :home, :opponent, :team_score, :opponent_score, :score, :status, :nhl_game_id,
   :time_zone

  def initialize(game, team = nil)
    @time_zone = ActiveSupport::TimeZone.new(ENV["TIME_ZONE"]) 
    @time_raw = game.time.in_time_zone(@time_zone)
    @time = @time_raw.strftime("%H:%M")
    @date = @time_raw.strftime("%F")
    @venue_name = game.venue_name
    @nhl_game_id = game.game_pk.to_s
    
    @status = game.status_detailed_state
    if team
      if game.home_team.team_name == team.short_name
        @home = true
        @opponent = Team.find_by(short_name: game.away_team.team_name)
        @team_score = game.home["score"].to_i
        @opponent_score = game.away["score"].to_i
      else
        @home = false
        @opponent = Team.find_by(short_name: game.home_team.team_name)
        @team_score = game.away["score"].to_i
        @opponent_score = game.home["score"].to_i
      end
      if @status == "Final"
        @score = @team_score > @opponent_score ? "W #{@team_score} - #{@opponent_score}" : "L #{@team_score} - #{@opponent_score}"
      elsif @status == "In Progress"
        @score = "#{@team_score} - #{@opponent_score}"
      else
        @score = "Not started"
      end
    end
  end

  def url
    nhl_game_id_year = @nhl_game_id[0..3]
    nhl_game_id_number = @nhl_game_id[4..-1]
    "http://www.nhl.com/scores/htmlreports/#{nhl_game_id_year}#{(nhl_game_id_year.to_i + 1).to_s}/GS#{nhl_game_id_number}.HTM"
  end
end