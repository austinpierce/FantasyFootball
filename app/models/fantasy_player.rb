class FantasyPlayer < ApplicationRecord
  
  belongs_to :player
  belongs_to :fantasy_team
  
  def self.InsertPlayers
    players = Player.all.ids
    
    players.sort!
    players.each { |x| FantasyPlayer.create(player_id: "#{x}") }
  end
 
  def self.calculateAuctionCash(teamID)
    FantasyPlayer.where(fantasy_team_id: teamID).sum(:auction_sold_price)
  end
  
  def self.calculateNerdRank(teamID)
    FantasyPlayer.joins(:player).where(fantasy_team_id: teamID).sum(:nerd_rank)
  end
  
end
