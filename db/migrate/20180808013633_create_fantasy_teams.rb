class CreateFantasyTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :fantasy_teams do |t|
      t.string :fantasy_team_name
      t.string :owner_name
      t.float :auction_cash

      t.timestamps
    end
  end
end
