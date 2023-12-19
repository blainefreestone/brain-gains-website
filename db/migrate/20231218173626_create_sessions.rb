class CreateSessions < ActiveRecord::Migration[7.1]
  def change
    create_table :sessions do |t|
      t.date :date
      t.references :engagement, null: false, foreign_key: true
      t.integer :length_fifteen_minutes
      t.text :details

      t.timestamps
    end
  end
end
