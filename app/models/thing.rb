class Thing
  include Mongoid::Document
  include Mongoid::Taggable
  include Mongoid::Timestamps
  include Mongoid::FullTextSearch

  field :name, :type => String
  field :description, :type => String

  has_and_belongs_to_many :owners, class_name: "Account", inverse_of: :owner_things
  has_and_belongs_to_many :caretakers, class_name: "Account", inverse_of: :caretaker_things
  has_and_belongs_to_many :users, class_name: "Account", inverse_of: :user_things
  belongs_to :place

  fulltext_search_in :name, :description, :separated_tags, :owner_names

  validates_presence_of :name

  def separated_tags
    self.tags_array.join(" ")
  end
  
  def owner_names
    self.owners.collect{ |o| o.username }.join(" ")
  end
end
