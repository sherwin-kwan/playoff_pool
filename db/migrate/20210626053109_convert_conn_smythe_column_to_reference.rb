class ConvertConnSmytheColumnToReference < ActiveRecord::Migration[6.0]
  def change
    remove_column :predictions, :conn_smythe, :string
    add_column :predictions, :conn_smythe_id, :integer
  end
end
