class AddConnSmytheToSeries < ActiveRecord::Migration[7.0]
  def change
    add_column :series, :conn_smythe_id, :integer
  end
end
