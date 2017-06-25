# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Delete users' do
  scenario 'user deletes their user' do
    user = FactoryGirl.create(:user, first_name: 'Daffy', last_name: 'Duck')
    visit root_path
    mock_auth_hash(user: user)
    click_link 'Sign in with Google'

    click_link 'Daffy Duck'
    click_link('Permanently delete user')
    expect(page).to have_text 'Sign in with Google'
  end
end
