class Account < ActiveRecord::Base
  has_many :thing_roles, :dependent => :destroy
  has_many :things, :through => :thing_roles
  has_many :event_roles
  has_many :events, :through => :event_roles
  has_many :place_roles
  has_many :places, :through => :place_roles

  # DISTINGUISH BETWEEN OWNER AND KEEPER THINGS VIA ROLES
  has_many :thing_owners, :class_name => "ThingRole", :conditions => { :role => "owner" },
    :dependent => :destroy
  has_many :owner_things, :through => :thing_owners, :source => :thing
  has_many :thing_keepers, :class_name => "ThingRole", :conditions => { :role => "keeper" },
    :dependent => :destroy
  has_many :keeper_things, :through => :thing_keepers, :source => :thing

  validates_presence_of :name, :email
end
