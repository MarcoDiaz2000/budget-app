require 'rails_helper'

RSpec.feature 'Groups', type: :feature do
  before do
    user = User.create(email: 'test@example.com', name: 'Marco', password: 'password')

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Next'
  end

  scenario 'User creates a new group' do
    visit new_group_path

    fill_in 'Name of the category', with: 'Test Group'
    choose('icon1')
    click_button 'Save'

    expect(page).to have_text('Test Group')
  end

  scenario 'User sees their groups' do
    user = User.last
    Group.create(name: 'Existing Group', icon: 'icon1.png', user_id: user.id)

    visit groups_path

    expect(page).to have_text('Existing Group')
  end
end
