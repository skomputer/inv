class CreatePlaceRoles < ActiveRecord::Migration
  def self.up
    create_table :place_roles do |t|
      t.references :account
      t.references :place
      t.string :role

      t.timestamps
    end
  end

  def self.down
    drop_table :place_roles
  end
end
