class CreateEventRoles < ActiveRecord::Migration
  def self.up
    create_table :event_roles do |t|
      t.integer :account_id
      t.integer :event_id
      t.string :role

      t.timestamps
    end
  end

  def self.down
    drop_table :event_roles
  end
end
