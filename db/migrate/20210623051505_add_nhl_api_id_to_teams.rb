class AddNhlApiIdToTeams < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :nhl_api_id, :integer
  end
end
