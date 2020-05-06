class CreateTournaments < ActiveRecord::Migration[6.0]
  def change
    create_table :tournaments do |t|
      t.string :name
      t.datetime :tournament_date
      t.string :contact_name
      t.string :contact_phone_number
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :tournaments, [:user_id, :created_at]
  end
end
