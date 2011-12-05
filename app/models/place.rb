class Place < ActiveRecord::Base
  has_many :things

  has_many :place_roles
  has_many :accounts, :through => :place_roles  

  has_many :events
end
