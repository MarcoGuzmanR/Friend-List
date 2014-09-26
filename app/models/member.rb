class Member < ActiveRecord::Base
  has_many :friends
end
