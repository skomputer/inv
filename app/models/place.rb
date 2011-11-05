class Place
  include Mongoid::Document

  field :name, :type => String
  field :description, :type => String
  field :street, :type => String
  field :street2, :type => String
  field :city, :type => String
  field :state, :type => String
  field :zip, :type => String
  field :longitude, :type => String
  field :latitude, :type => String

  has_many :things

  validates_presence_of :name
end
