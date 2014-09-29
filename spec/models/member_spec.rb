require 'rails_helper'

RSpec.describe Member, type: :model do
  describe 'Associations' do
    it { should have_many :friends }
  end
end
