class CreateThingRoles < ActiveRecord::Migration
  def self.up
    create_table :thing_roles do |t|
      t.references :account
      t.references :thing
      t.string :role

      t.timestamps
    end
  end

  def self.down
    drop_table :thing_roles
  end
end
