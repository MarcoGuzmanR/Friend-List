require 'spec_helper'

feature 'Display the member page' do
  let!(:member)  { FactoryGirl.create(:member) }
  let!(:friend)  { FactoryGirl.create(:friend, name: 'Jane Doe', email: 'jane.doe@friendlist.com', member_id: member.id) }
  let!(:friend1) { FactoryGirl.create(:friend, name: 'Michael Corleone', email: 'michael.corleone@friendlist.com', member_id: member.id) }

  scenario 'Show friends of a certain member', :js do
    visit member_path(member.id)
    expect(page).to have_content member.name
    expect(page).to have_content friend.name
    expect(page).to have_content friend.email
  end

  scenario 'Show a specific friend', :js do
    visit member_path(member.id)
    expect(page).to have_content member.name
    fill_in 'friendInputText', with: 'Michael'
    expect(page).to have_content friend1.name
    expect(page).to have_content friend1.email
  end
end

feature 'Add a new friend to the member' do
  let!(:member)  { FactoryGirl.create(:member) }

  scenario 'Add friend successfully', :js do
    visit member_path(member.id)
    click_on 'Add New Friend'
    fill_in 'friendName', with: 'Gordon Freeman'
    fill_in 'friendEmail', with: 'gordon.freeman@friendlist.com'
    click_on 'Add Friend'
    expect(Friend.count).to eql 1
  end
end
