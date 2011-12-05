class Thing < ActiveRecord::Base
  has_many :thing_roles
  has_many :accounts, :through => :thing_roles  
  has_and_belongs_to_many :events
  belongs_to :place

  acts_as_taggable

  paginates_per 50
end
