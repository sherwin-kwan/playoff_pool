class ImportTeamsAndPlayers < ActiveRecord::Migration[6.0]
  def up
    # system('bin/rails runner script/import_teams_and_players.rb &')
    Team.find_each do |team|
      the_team = NHL::Team.find_short_name(team.short_name)
      if the_team
        team.nhl_api_id = the_team.id
        team.save
        the_team.roster.each do |player|
          split_names = player.full_name.split(" ")
          p = Player.create(first_name: split_names[0], last_name: split_names[1], team_id: team.id)
        end
      end
    end

    # current_year_final = Series.where(year: Time.now.year).where(round_id: 4).first
    # if current_year_final 
    #   team1_players = NHL::Team.find(current_year_final.team1.nhl_api_id).roster
    #   team2_players = NHL::Team.find(current_year_final.team2.nhl_api_id).roster

  end

  def down
    Player.destroy_all
    Team.find_each do |team|
      team.nhl_api_id = nil
      team.save
    end
  end
end
