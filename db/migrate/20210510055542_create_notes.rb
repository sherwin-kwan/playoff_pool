class CreateNotes < ActiveRecord::Migration[6.0]
  def change
    create_table :notes do |t|
      t.integer :version
      t.string :summary
      t.text :note
    end
  end
end
