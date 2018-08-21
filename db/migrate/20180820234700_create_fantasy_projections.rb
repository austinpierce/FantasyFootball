class CreateFantasyProjections < ActiveRecord::Migration[5.1]
  def change
    create_table :fantasy_projections do |t|
      t.references :player
      t.string :position
      t.float :completions
      t.float :attempts
      t.float :passing_yards
      t.float :passing_td
      t.float :passing_int
      t.float :rush_yards
      t.float :rush_att
      t.float :rush_td
      t.float :rec
      t.float :rec_yards
      t.float :rec_td
      t.float :fumbles
      t.float :sacks
      t.float :interceptions
      t.float :fumble_rec
      t.float :td
      t.float :special_team_td
      t.float :xp
      t.float :fg
      t.float :fantasy_points
      t.timestamps
    end
  end
end
