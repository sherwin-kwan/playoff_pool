class SeedRoundsFor2021 < ActiveRecord::Migration[6.0]
  def up
    Round.create(round: 1, fancy_name: "Division Semifinal", base_score: 1)
    Round.create(round: 2, fancy_name: "Division Final", base_score: 1)
    Round.create(round: 3, fancy_name: "Conference Final", base_score: 2)
    Round.create(round: 4, fancy_name: "Stanley Cup Final", base_score: 2)
  end

  def down
    # no down
  end
end
