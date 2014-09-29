require 'rails_helper'

RSpec.describe Friend, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
  end

  describe 'Associations' do
    it { should belong_to :member }
  end
end
