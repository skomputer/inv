class CreateEventThingJoinTable < ActiveRecord::Migration
  def change
    create_table :event_things, :id => false do |t|
      t.integer :event_id
      t.integer :thing_id
    end
  end
end