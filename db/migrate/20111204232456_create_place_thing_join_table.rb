class CreatePlaceThingJoinTable < ActiveRecord::Migration
  def change
    create_table :place_things, :id => false do |t|
      t.integer :place_id
      t.integer :thing_id
    end
  end
end