class CreatePlaceRoles < ActiveRecord::Migration
  def self.up
    create_table :place_roles do |t|
      t.integer :account_id
      t.integer :place_id
      t.string :role

      t.timestamps
    end
  end

  def self.down
    drop_table :place_roles
  end
end
