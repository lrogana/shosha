class AddContactEmailToTournament < ActiveRecord::Migration[6.0]
  def change
    add_column :tournaments, :email, :string
  end
end
