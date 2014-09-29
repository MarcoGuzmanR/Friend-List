require 'rails_helper'

RSpec.describe FriendsController, type: :controller do
  it 'expects an ok status' do
    subject { post :create, widget: { name: 'John Doe', email: 'john.doe@friendlist.com' } }
    expect(response).to have_http_status(:ok)
  end
end
