class RealignTeams < ActiveRecord::Migration[7.0]
  def up
    p = Division.create(name: "Pacific")
    c = Division.create(name: "Central")
    m = Division.create(name: "Metropolitan")
    a = Division.create(name: "Atlantic")

    p.teams.create(name: "Seattle Kraken", short_name: "Kraken")

    Team.find_by(short_name: "Ducks").update(division_id: p.id)
    Team.find_by(short_name: "Kings").update(division_id: p.id)
    Team.find_by(short_name: "Canucks").update(division_id: p.id)
    Team.find_by(short_name: "Flames").update(division_id: p.id)
    Team.find_by(short_name: "Oilers").update(division_id: p.id)
    Team.find_by(short_name: "Sharks").update(division_id: p.id)
    Team.find_by(short_name: "Knights").update(division_id: p.id)

    Team.find_by(short_name: "Coyotes").update(division_id: c.id)
    Team.find_by(short_name: "Avalanche").update(division_id: c.id)
    Team.find_by(short_name: "Blackhawks").update(division_id: c.id)
    Team.find_by(short_name: "Blues").update(division_id: c.id)
    Team.find_by(short_name: "Wild").update(division_id: c.id)
    Team.find_by(short_name: "Jets").update(division_id: c.id)
    Team.find_by(short_name: "Predators").update(division_id: c.id)
    Team.find_by(short_name: "Stars").update(division_id: c.id)

    Team.find_by(short_name: "Penguins").update(division_id: m.id)
    Team.find_by(short_name: "Flyers").update(division_id: m.id)
    Team.find_by(short_name: "Islanders").update(division_id: m.id)
    Team.find_by(short_name: "Devils").update(division_id: m.id)
    Team.find_by(short_name: "Rangers").update(division_id: m.id)
    Team.find_by(short_name: "Hurricanes").update(division_id: m.id)
    Team.find_by(short_name: "Jackets").update(division_id: m.id)
    Team.find_by(short_name: "Capitals").update(division_id: m.id)

    Team.find_by(short_name: "Leafs").update(division_id: a.id)
    Team.find_by(short_name: "Canadiens").update(division_id: a.id)
    Team.find_by(short_name: "Senators").update(division_id: a.id)
    Team.find_by(short_name: "Sabres").update(division_id: a.id)
    Team.find_by(short_name: "Bruins").update(division_id: a.id)
    Team.find_by(short_name: "Lightning").update(division_id: a.id)
    Team.find_by(short_name: "Red Wings").update(division_id: a.id)
    Team.find_by(short_name: "Panthers").update(division_id: a.id)
  end

  def down
    # no down
  end
end
