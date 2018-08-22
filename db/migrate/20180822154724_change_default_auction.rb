class ChangeDefaultAuction < ActiveRecord::Migration[5.1]
  def change
    change_column :fantasy_players, :auction_projected_price, :float, default: 0
    change_column :fantasy_players, :auction_spend_price, :float, default: 0
    change_column :fantasy_players, :auction_sold_price, :float, default: 0
    add_column :fantasy_players, :rookie_asset, :boolean, default: false
  end
end
