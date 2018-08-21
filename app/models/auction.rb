class Auction < ApplicationRecord
  
  belongs_to :player
  
  def self.InitialAuction
    allAuction = HTTParty.get("https://www.fantasyfootballnerd.com/service/auction-enhanced/json/test/ppr/")
    auction = allAuction[2]
    playerSize = auction["Players"].size
    arrayPosition = 0

    until playerSize == 0
      
      player = auction["Players"][arrayPosition]
      
      playerId = player["playerId"]
      avgPrice = player["avgPrice"]
      displayName = player["displayName"]

      Auction.create(player_id: "#{playerId}", auction_price: "#{avgPrice}", display_name: "#{displayName}")
      playerSize -= 1
      arrayPosition += 1
    end

  end 
  
  def self.UpdateProjectedPrice
    FantasyPlayer.connection.update("UPDATE fantasy_players as FP
                SET auction_projected_price = A.auction_price
                FROM auctions AS A 
                WHERE FP.player_id = A.player_id")
  end
  
end
