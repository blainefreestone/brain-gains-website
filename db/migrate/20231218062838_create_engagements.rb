class CreateEngagements < ActiveRecord::Migration[7.1]
  def change
    create_table :engagements do |t|
      t.references :tutor, null: false, foreign_key: { to_table: :users }
      t.references :student, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
