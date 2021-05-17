class AddLowerSeedIncorrectToResults < ActiveRecord::Migration[6.0]
  def change
    add_column :results, :lower_seed_incorrect, :integer
  end
end
