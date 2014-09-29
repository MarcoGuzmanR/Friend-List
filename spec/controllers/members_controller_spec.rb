require 'rails_helper'

RSpec.describe MembersController, type: :controller do
  let!(:member) { FactoryGirl.create :member }
  it 'renders the html format' do
    subject { get :show, widget: { id: member.id } }
    expect(response).to have_http_status(:ok)
  end
end
