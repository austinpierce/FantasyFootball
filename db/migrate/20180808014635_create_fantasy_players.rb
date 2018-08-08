class CreateFantasyPlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :fantasy_players do |t|
      t.references :player
      t.references :fantasy_team
      t.boolean :watch, default: false
      t.boolean :keeper, default: false
      t.float :auction_projected_price
      t.float :auction_spend_price
      t.float :auction_sold_price

      t.timestamps
    end
  end
end
