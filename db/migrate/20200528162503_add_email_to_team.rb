class AddEmailToTeam < ActiveRecord::Migration[6.0]
  def change
    add_column :teams, :email, :string
  end
end
