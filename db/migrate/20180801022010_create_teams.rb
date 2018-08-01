class CreateTeams < ActiveRecord::Migration[5.1]
  def change
    create_table :teams do |t|
      t.string :code
      t.string :fullName
      t.string :shortName

      t.timestamps
    end
  end
end
