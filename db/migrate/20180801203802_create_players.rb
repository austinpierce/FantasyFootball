class CreatePlayers < ActiveRecord::Migration[5.1]
  def change
    create_table :players do |t|
      t.integer :player_id
      t.string :position
      t.string :display_name
      t.string :first_name
      t.string :last_name
      t.string :team
      t.integer :bye_week
      t.float :nerd_rank
      t.integer :position_rank
      t.integer :overall_rank

      t.timestamps
    end
  end
end
