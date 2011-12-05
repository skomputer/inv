class PlaceRole < ActiveRecord::Base
  belongs_to :account
  belongs_to :place
end
