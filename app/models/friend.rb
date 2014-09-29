class Friend < ActiveRecord::Base
  belongs_to :member

  validates :name, :email, presence: true
end
