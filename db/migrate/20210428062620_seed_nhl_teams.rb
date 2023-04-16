class SeedNhlTeams < ActiveRecord::Migration[6.0]
  def up
    w = Division.find_by(name: "West")
    c = Division.find_by(name: "Central")
    e = Division.find_by(name: "East")
    n = Division.find_by(name: "North")

    w.teams.create(name: "Anaheim Ducks", short_name: "Ducks")
    w.teams.create(name: "Arizona Coyotes", short_name: "Coyotes")
    w.teams.create(name: "Colorado Avalanche", short_name: "Avalanche")
    w.teams.create(name: "Los Angeles Kings", short_name: "Kings")
    w.teams.create(name: "Minnesota Wild", short_name: "Wild")
    w.teams.create(name: "St. Louis Blues", short_name: "Blues")
    w.teams.create(name: "San Jose Sharks", short_name: "Sharks")
    w.teams.create(name: "Vegas Golden Knights", short_name: "Knights")
    c.teams.create(name: "Carolina Hurricanes", short_name: "Hurricanes")
    c.teams.create(name: "Chicago Blackhawks", short_name: "Blackhawks")
    c.teams.create(name: "Columbus Blue Jackets", short_name: "Jackets")
    c.teams.create(name: "Dallas Stars", short_name: "Stars")
    c.teams.create(name: "Detroit Red Wings", short_name: "Red Wings")
    c.teams.create(name: "Florida Panthers", short_name: "Panthers")
    c.teams.create(name: "Nashville Predators", short_name: "Predators")
    c.teams.create(name: "Tampa Bay Lightning", short_name: "Lightning")
    e.teams.create(name: "Boston Bruins", short_name: "Bruins")
    e.teams.create(name: "Buffalo Sabres", short_name: "Sabres")
    e.teams.create(name: "New Jersey Devils", short_name: "Devils")
    e.teams.create(name: "New York Islanders", short_name: "Islanders")
    e.teams.create(name: "New York Rangers", short_name: "Rangers")
    e.teams.create(name: "Philadelphia Flyers", short_name: "Flyers")
    e.teams.create(name: "Pittsburgh Penguins", short_name: "Penguins")
    e.teams.create(name: "Washington Capitals", short_name: "Capitals")
    n.teams.create(name: "Calgary Flames", short_name: "Flames")
    n.teams.create(name: "Edmonton Oilers", short_name: "Oilers")
    n.teams.create(name: "Canadiens de Montréal", short_name: "Canadiens")
    n.teams.create(name: "Ottawa Senators", short_name: "Senators")
    n.teams.create(name: "Toronto Maple Leafs", short_name: "Leafs")
    n.teams.create(name: "Vancouver Canucks", short_name: "Canucks")
    n.teams.create(name: "Winnipeg Jets", short_name: "Jets")
    n.teams.create(name: "Seattle Kraken", short_name: "Kraken")
  end

  def down
    # No going back!
  end
end
