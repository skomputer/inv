class CreateThingRoles < ActiveRecord::Migration
  def self.up
    create_table :thing_roles do |t|
      t.integer :account_id
      t.integer :thing_id
      t.string :role

      t.timestamps
    end
  end

  def self.down
    drop_table :thing_roles
  end
end
