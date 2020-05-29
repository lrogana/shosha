class AddSportToTournament < ActiveRecord::Migration[6.0]
  def change
    add_column :tournaments, :sport, :string
  end
end
