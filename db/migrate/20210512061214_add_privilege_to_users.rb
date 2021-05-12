class AddPrivilegeToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :privilege, :integer, default: 0
  end
end
