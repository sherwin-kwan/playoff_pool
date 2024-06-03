class AddLogoSrcToTeams < ActiveRecord::Migration[7.1]
  def change
    add_column :teams, :logo_src, :string
    add_column :teams, :abbrev, :string
  end
end
