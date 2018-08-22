class FantasyProjection < ApplicationRecord
  
  belongs_to :player
  
  def self.QB_InitialProjections
    qbs = HTTParty.get("https://www.fantasyfootballnerd.com/service/draft-projections/json/#{ENV["API_FOOTBALL"]}/QB/")

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
    rbs = HTTParty.get("https://www.fantasyfootballnerd.com/service/draft-projections/json/#{ENV["API_FOOTBALL"]}/RB/")

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
  
  def self.WR_InitialProjections
    wrs = HTTParty.get("https://www.fantasyfootballnerd.com/service/draft-projections/json/#{ENV["API_FOOTBALL"]}/WR/")

    playerSize = wrs["DraftProjections"].size
    arrayPosition = 0

    until playerSize == 0
      
      wr = wrs["DraftProjections"][arrayPosition]
      
      playerId = wr["playerId"]
      rushAtt = wr["rushAtt"]
      rushYards = wr["rushYards"]
      rushTD = wr["rushTD"]
      fumbles = wr["fumbles"]
      rec = wr["rec"]
      recYards = wr["recYards"]
      recTD = wr["recTD"]
      fantasyPoints = wr["fantasyPoints"]
      
      FantasyProjection.create(player_id: "#{playerId}", position: "WR", rush_att: "#{rushAtt}", rush_yards: "#{rushYards}", rush_td: "#{rushTD}", fumbles: "#{fumbles}", rec: "#{rec}", rec_yards: "#{recYards}", rec_td: "#{recTD}", fantasy_points: "#{fantasyPoints}")
      playerSize -= 1
      arrayPosition += 1
    end

  end
  
  def self.TE_InitialProjections
    tes = HTTParty.get("https://www.fantasyfootballnerd.com/service/draft-projections/json/#{ENV["API_FOOTBALL"]}/TE/")

    playerSize = tes["DraftProjections"].size
    arrayPosition = 0

    until playerSize == 0
      
      te = tes["DraftProjections"][arrayPosition]
      
      playerId = te["playerId"]
      rushAtt = te["rushAtt"]
      rushYards = te["rushYards"]
      rushTD = te["rushTD"]
      fumbles = te["fumbles"]
      rec = te["rec"]
      recYards = te["recYards"]
      recTD = te["recTD"]
      fantasyPoints = te["fantasyPoints"]
      
      FantasyProjection.create(player_id: "#{playerId}", position: "TE", rush_att: "#{rushAtt}", rush_yards: "#{rushYards}", rush_td: "#{rushTD}", fumbles: "#{fumbles}", rec: "#{rec}", rec_yards: "#{recYards}", rec_td: "#{recTD}", fantasy_points: "#{fantasyPoints}")
      playerSize -= 1
      arrayPosition += 1
    end

  end
  
  def self.DEF_InitialProjections
    defenses = HTTParty.get("https://www.fantasyfootballnerd.com/service/draft-projections/json/#{ENV["API_FOOTBALL"]}/DEF/")

    playerSize = defenses["DraftProjections"].size
    arrayPosition = 0

    until playerSize == 0
      
      defense = defenses["DraftProjections"][arrayPosition]
      
      playerId = defense["playerId"]
      sacks = defense["sacks"]
      interceptions = defense["interceptions"]
      fumbleRec = defense["fumbleRec"]
      td = defense["TD"]
      specialTeamTD = defense["specialTeamTD"]
      fantasyPoints = defense["fantasyPoints"]
      
      FantasyProjection.create(player_id: "#{playerId}", position: "DEF", sacks: "#{sacks}", interceptions: "#{interceptions}", fumble_rec: "#{fumbleRec}", td: "#{td}", special_team_td: "#{specialTeamTD}", fantasy_points: "#{fantasyPoints}")
      playerSize -= 1
      arrayPosition += 1
    end

  end
  
  def self.K_InitialProjections
    kickers = HTTParty.get("https://www.fantasyfootballnerd.com/service/draft-projections/json/#{ENV["API_FOOTBALL"]}/K/")

    playerSize = kickers["DraftProjections"].size
    arrayPosition = 0

    until playerSize == 0
      
      kicker = kickers["DraftProjections"][arrayPosition]
      
      playerId = kicker["playerId"]
      xp = kicker["xp"]
      fg = kicker["fg"]
      fantasyPoints = kicker["fantasyPoints"]
      
      FantasyProjection.create(player_id: "#{playerId}", position: "K", xp: "#{xp}", fg: "#{fg}", fantasy_points: "#{fantasyPoints}")
      playerSize -= 1
      arrayPosition += 1
    end

  end
  
end
