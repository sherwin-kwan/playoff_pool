class SeedFirstFewSeriesFor2021 < ActiveRecord::Migration[6.0]
  def up
    Series.create(year: 2021, round: Round.find_by(round: 1), team1: Team.find_by(short_name: "Hurricanes"), team2: Team.find_by(short_name: "Predators"))
    Series.create(year: 2021, round: Round.find_by(round: 1), team1: Team.find_by(short_name: "Panthers"), team2: Team.find_by(short_name: "Lightning"))
    Series.create(year: 2021, round: Round.find_by(round: 1), team1: Team.find_by(short_name: "Leafs"), team2: Team.find_by(short_name: "Canadiens"))
    Series.create(year: 2021, round: Round.find_by(round: 1), team1: Team.find_by(short_name: "Oilers"), team2: Team.find_by(short_name: "Jets"))
    Series.create(year: 2021, round: Round.find_by(round: 1), team1: Team.find_by(short_name: "Penguins"), team2: Team.find_by(short_name: "Islanders"))
    Series.create(year: 2021, round: Round.find_by(round: 1), team1: Team.find_by(short_name: "Capitals"), team2: Team.find_by(short_name: "Bruins"))
  end

  def down

  end
end
