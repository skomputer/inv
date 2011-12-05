class Account < ActiveRecord::Base
  has_many :thing_roles
  has_many :things, :through => :thing_roles
  
  has_many :event_roles
  has_many :events, :through => :event_roles

  has_many :place_roles
  has_many :places, :through => :place_roles
end
