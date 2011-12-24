class Thing < ActiveRecord::Base
  has_many :thing_roles, :dependent => :destroy
  has_many :accounts, :through => :thing_roles
  has_and_belongs_to_many :events
  belongs_to :place

  # DISTINGUISH ACCOUNTS VIA ROLES
  has_many :thing_owners, :class_name => "ThingRole", :conditions => { :role => "owner" }, 
    :dependent => :destroy
  has_many :owners, :through => :thing_owners, :source => :account
  has_many :thing_keepers, :class_name => "ThingRole", :conditions => { :role => "keeper" },
    :dependent => :destroy
  has_many :keepers, :through => :thing_keepers, :source => :account

  acts_as_taggable

  paginates_per 50

  validates_presence_of :name, :owners, :keepers, :place
end
