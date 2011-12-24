class CreateEventRoles < ActiveRecord::Migration
  def self.up
    create_table :event_roles do |t|
      t.references :account
      t.references :event
      t.string :role

      t.timestamps
    end
  end

  def self.down
    drop_table :event_roles
  end
end
