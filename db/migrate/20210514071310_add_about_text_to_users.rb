class AddAboutTextToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :about_text, :text
  end
end
