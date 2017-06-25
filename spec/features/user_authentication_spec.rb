# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'user authentication' do
  scenario 'user logs in with google auth' do
    visit root_path
    expect(page).to have_link('Sign in with Google')
    mock_auth_hash
    click_link 'Sign in with Google'
    expect(page).to have_content('Michael Siegfried')
  end

  scenario 'user logs out' do
    mock_auth_hash
    visit root_path
    expect(page).to have_link('Sign in with Google')
    click_link 'Sign in with Google'
    expect(page).to have_link('Logout')
    click_link 'Logout'
    expect(page).to have_link('Sign in with Google')
  end

  scenario 'user token expired' do
    visit root_path
    expect(page).to have_link('Sign in with Google')
    mock_auth_hash(expires_at: 1.hour.ago)
    click_link 'Sign in with Google'
    expect(page).to have_link('Sign in with Google')
  end
end