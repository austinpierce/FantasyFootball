class ChangePrimaryKey < ActiveRecord::Migration[5.1]
  def up
    remove_column :players, :id # remove existing primary key
    rename_column :players, :player_id, :id # rename existing UDID column
    execute "ALTER TABLE PLAYERS ADD PRIMARY KEY (id);"
  end

  def down
    # Remove the UDID primary key. Note this would differ based on your database
    execute "ALTER TABLE PLAYERS DROP CONSTRAINT table_pkey;"
    rename_column :players, :id, :player_id
    add_column :players, :id, :primary_key
  end
end
