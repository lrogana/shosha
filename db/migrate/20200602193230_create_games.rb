class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.datetime :start
      t.datetime :end
      t.string :location
      t.integer :first_team_id
      t.integer :second_team_id
      t.integer :winning_team
      t.integer :first_team_score
      t.integer :second_team_score
      t.references :tournament, null: false, foreign_key: true

      t.timestamps
    end
  end
end
