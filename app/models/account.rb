class Account
  include Mongoid::Document
  field :username, :type => String
  field :email, :type => String
  has_and_belongs_to_many :owner_things, class_name: "Thing", inverse_of: :owners
  has_and_belongs_to_many :caretaker_things, class_name: "Thing", inverse_of: :caretakers
  has_and_belongs_to_many :user_things, class_name: "Thing", inverse_of: :users
end
