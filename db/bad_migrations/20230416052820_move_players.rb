class MovePlayers < ActiveRecord::Migration[7.0]
  def up
    # system('bin/rails runner script/import_teams_and_players.rb &')
    Team.find_each do |team|
      the_team = NHL::Team.find_short_name(team.short_name)
      if the_team
        team.nhl_api_id = the_team.id
        team.save
        the_team.roster.each do |player|
          split_names = player.full_name.split(" ")
          p = Player.find_by(first_name: split_names[0], last_name: split_names[1])
          if p
            p.update(team_id: team.id)
          else
            Player.create(first_name: split_names[0], last_name: split_names[1], team_id: team.id)
          end
        end
      end
    end
  end
end
