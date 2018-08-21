class FantasyProjection < ApplicationRecord
  
  belongs_to :player
  
  def self.QB_InitialProjections
    qbs = HTTParty.get("https://www.fantasyfootballnerd.com/service/draft-projections/json/test/QB/")

    playerSize = qbs["DraftProjections"].size
    arrayPosition = 0

    until playerSize == 0
      
      qb = qbs["DraftProjections"][arrayPosition]
      
      playerId = qb["playerId"]
      completions = qb["completions"]
      attempts = qb["attempts"]
      passingYards = qb["passingYards"]
      passingTD = qb["passingTD"]
      passingInt = qb["passingInt"]
      rushYards = qb["rushYards"]
      rushTD = qb["rushTD"]
      fantasyPoints = qb["fantasyPoints"]
      
      FantasyProjection.create(player_id: "#{playerId}", position: "QB", completions: "#{completions}", attempts: "#{attempts}", passing_yards: "#{passingYards}", passing_td: "#{passingTD}", passing_int: "#{passingInt}", rush_yards: "#{rushYards}", rush_td: "#{rushTD}", fantasy_points: "#{fantasyPoints}")
      playerSize -= 1
      arrayPosition += 1
    end

  end
  
def self.RB_InitialProjections
    rbs = HTTParty.get("https://www.fantasyfootballnerd.com/service/draft-projections/json/test/RB/")

    playerSize = rbs["DraftProjections"].size
    arrayPosition = 0

    until playerSize == 0
      
      rb = rbs["DraftProjections"][arrayPosition]
      
      playerId = rb["playerId"]
      rushAtt = rb["rushAtt"]
      rushYards = rb["rushYards"]
      rushTD = rb["rushTD"]
      fumbles = rb["fumbles"]
      rec = rb["rec"]
      recYards = rb["recYards"]
      recTD = rb["recTD"]
      fantasyPoints = rb["fantasyPoints"]
      
      FantasyProjection.create(player_id: "#{playerId}", position: "RB", rush_att: "#{rushAtt}", rush_yards: "#{rushYards}", rush_td: "#{rushTD}", fumbles: "#{fumbles}", rec: "#{rec}", rec_yards: "#{recYards}", rec_td: "#{recTD}", fantasy_points: "#{fantasyPoints}")
      playerSize -= 1
      arrayPosition += 1
    end

  end
  
end
