require 'rails_helper'

RSpec.feature 'Entities', type: :feature do
  before do
    user = User.create!(email: 'test@example.com', name: 'Marco', password: 'password',
                        password_confirmation: 'password')
    @group = Group.create!(name: 'Test Group', icon: 'icon1.png', user_id: user.id)

    expect(user.id).not_to be_nil
    expect(@group.id).not_to be_nil

    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Next'
  end

  scenario 'User creates a new entity' do
    visit new_group_entity_path(@group)

    fill_in 'Name of transaction', with: 'Test Entity'
    fill_in 'Amount', with: 100

    find('#group_select').find(:option, @group.name).select_option

    click_button 'Save'

    expect(page).to have_text('Test Entity')
    expect(page).to have_text('100')
  end
end
