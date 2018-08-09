class FantasyPlayer < ApplicationRecord
  
  belongs_to :player
  belongs_to :fantasy_team
  
  def self.InsertPlayers
    players = Player.all.ids
    
    players.sort!
    players.each { |x| FantasyPlayer.create(player_id: "#{x}") }
  end
 
end
