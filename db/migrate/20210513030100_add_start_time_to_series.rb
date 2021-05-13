class AddStartTimeToSeries < ActiveRecord::Migration[6.0]
  def change
    add_column :series, :start_time, :datetime
  end
end
