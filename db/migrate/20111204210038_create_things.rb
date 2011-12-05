class CreateThings < ActiveRecord::Migration
  def self.up
    create_table :things do |t|
      t.string :name
      t.string :details
      t.string :quantity
      t.integer :place_id      

      t.timestamps
    end
  end

  def self.down
    drop_table :things
  end
end
