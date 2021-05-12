class AddYearToSeries < ActiveRecord::Migration[6.0]
  def change
    add_column :series, :year, :integer
    add_column :series, :status, :integer, default: 0
  end
end
