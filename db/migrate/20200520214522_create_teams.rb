class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :team_contact_name
      t.string :team_contact_phone_number
      t.references :tournament, null: false, foreign_key: true

      t.timestamps
    end
    add_index :teams, [:tournament_id, :created_at]
  end
end
