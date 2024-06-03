require "faraday"
require "pry"

TEAM_API_URL = "https://api-web.nhle.com/v1/standings/2024-04-18"

team_name_differences = {
    "Knights" => "Golden Knights",
    "Leafs" => "Maple Leafs",
    "Jackets" => "Blue Jackets"
}

Player.destroy_all

res = Faraday.get(TEAM_API_URL)
team_standings = JSON.parse(res.body)["standings"]
Team.all.each do |team|
    nhl_api_team = team_standings.find{_1["teamCommonName"]["default"] == team.short_name || _1["teamCommonName"]["default"] == team_name_differences[team.short_name]}
    raise "can't find #{team_name_differences[team.short_name]}" if !nhl_api_team
    team.logo_src = nhl_api_team["teamLogo"]
    team.abbrev = nhl_api_team["teamAbbrev"]["default"]
    team.save
    player_api_url = "https://api-web.nhle.com/v1/roster/#{team.abbrev}/20232024"
    res2 = Faraday.get(player_api_url)
    nhl_formatted_roster = JSON.parse(res2.body) # Hash with 3 keys "forwards", "defencemen", and "goalies"
    roster = nhl_formatted_roster.values.flatten
    roster.each do |pl|
        Player.create({first_name: pl["firstName"]["default"], last_name: pl["lastName"]["default"], team_id: team.id})
    end 
end
