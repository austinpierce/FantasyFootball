class Player < ApplicationRecord
  self.primary_key = :id

  def self.InitialDraftRankings
    players = HTTParty.get("https://www.fantasyfootballnerd.com/service/draft-rankings/json/test/1/")

    playerSize = players["DraftRankings"].size
    arrayPosition = 0

    until playerSize == 0
      
      player = players["DraftRankings"][arrayPosition]
      
      playerId = player["playerId"]
      playerPosition = player["position"]
      displayName = player["displayName"]
      firstName = player["fname"]
      lastName = player["lname"]
      team = player["team"]
      byeWeek = player["byeWeek"]
      nerdRank = player["nerdRank"]
      positionRank = player["positionRank"]
      overallRank = player["overallRank"]
      
      Player.create(id: "#{playerId}", position: "#{playerPosition}", display_name: "#{displayName}", 
                    first_name: "#{firstName}", last_name: "#{lastName}", team: "#{team}",
                    bye_week: "#{byeWeek}", nerd_rank: "#{nerdRank}", position_rank: "#{positionRank}",
                    overall_rank: "#{overallRank}")
      playerSize -= 1
      arrayPosition += 1
    end

  end
  

end
