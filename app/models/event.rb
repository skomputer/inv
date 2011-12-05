class Event < ActiveRecord::Base
  has_many :event_roles
  has_many :accounts, :through => :event_roles  

  has_and_belongs_to_many :things

  belongs_to :place
end
