class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :name
      t.string :details
      t.string :street
      t.string :street2
      t.string :city
      t.string :state
      t.string :zip
      t.string :longitude
      t.string :latitude

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
