class Thing
  include Mongoid::Document
  field :name, :type => String
  field :description, :type => String
  has_and_belongs_to_many :owners, class_name: "Account", inverse_of: :owner_things
  has_and_belongs_to_many :caretakers, class_name: "Account", inverse_of: :caretaker_things
  has_and_belongs_to_many :users, class_name: "Account", inverse_of: :user_things
end
