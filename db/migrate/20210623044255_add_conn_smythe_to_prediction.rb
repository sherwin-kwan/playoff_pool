class AddConnSmytheToPrediction < ActiveRecord::Migration[6.0]
  def change
    add_column :predictions, :conn_smythe, :string
  end
end
