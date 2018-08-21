class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.references :player
      t.float :auction_price
      t.string :display_name
      t.timestamps
    end
  end
end
