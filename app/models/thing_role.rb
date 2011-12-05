class ThingRole < ActiveRecord::Base
  belongs_to :account
  belongs_to :thing

  paginates_per 50
end
