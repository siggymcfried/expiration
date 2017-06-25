# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'user logs in' do
  scenario 'using google oauth2' do
    visit root_path
    expect(page).to have_link('Sign in with Google')
    mock_auth_hash
    click_link 'Sign in with Google'
    expect(page).to have_content('Michael Siegfried')
    expect(page).to have_link('Logout')
  end
end
