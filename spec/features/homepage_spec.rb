require 'spec_helper'

feature 'Display the homepage' do
  let!(:member)  { FactoryGirl.create(:member) }
  let!(:member2) { FactoryGirl.create(:member, name: 'Jane Doe') }

  scenario 'Show all members', :js do
    visit root_path
    expect(page).to have_content 'Friend List'
    expect(page).to have_content member.name
    expect(page).to have_content member2.name
  end

  scenario 'Show a specific member', :js do
    visit root_path
    expect(page).to have_content 'Friend List'
    fill_in 'memberInputText', with: 'Jane'
    expect(page).not_to have_content member.name
    expect(page).to have_content member2.name
  end
end
