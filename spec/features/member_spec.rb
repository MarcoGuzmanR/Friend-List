require 'spec_helper'

feature 'Display the member page' do
  let!(:member) { FactoryGirl.create(:member) }
  let!(:friend) { FactoryGirl.create(:friend, name: 'Jane Doe', email: 'jane.doe@friendlist.com', member_id: member.id) }

  scenario 'Show friends of a certain member', :js do
    visit member_path(member.id)
    expect(page).to have_content 'John Doe'
    expect(page).to have_content 'Jane Doe'
    expect(page).to have_content 'jane.doe@friendlist.com'
  end
end
