class CreateEventsThings < ActiveRecord::Migration
  def self.up
    create_table :events_things, :id => false do |t|
      t.references :event
      t.references :thing
    end
  end

  def self.down
    drop_table :events_things
  end
end