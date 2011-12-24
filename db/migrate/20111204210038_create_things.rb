class CreateThings < ActiveRecord::Migration
  def self.up
    create_table :things do |t|
      t.string :name
      t.string :details
      t.string :quantity
      t.references :place   

      t.timestamps
    end
  end

  def self.down
    drop_table :things
  end
end
