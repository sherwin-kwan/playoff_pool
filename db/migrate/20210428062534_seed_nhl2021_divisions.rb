class SeedNhl2021Divisions < ActiveRecord::Migration[6.0]
  def up
    Division.create(name: "West")
    Division.create(name: "Central")
    Division.create(name: "East")
    Division.create(name: "North")
  end

  def down
    # No down
  end
end
