require 'spec_helper'

feature 'Display the homepage' do
  let!(:member)  { FactoryGirl.create(:member) }
  let!(:member2) { FactoryGirl.create(:member, name: 'Jane Doe') }

  scenario 'Show all members', :js do
    visit root_path
    expect(page).to have_content 'Friend List'
    expect(page).to have_content 'John Doe'
    expect(page).to have_content 'Jane Doe'
  end
end
