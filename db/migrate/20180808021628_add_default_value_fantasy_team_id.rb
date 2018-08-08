class AddDefaultValueFantasyTeamId < ActiveRecord::Migration[5.1]
  def change
    change_column :fantasy_players, :fantasy_team_id, :integer, :default => 1
  end
end
