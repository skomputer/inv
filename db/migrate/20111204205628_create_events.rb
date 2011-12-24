class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.string :details
      t.datetime :start_time
      t.datetime :end_time
      t.references :place

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
