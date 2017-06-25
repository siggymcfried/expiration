# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'user logs in' do
  scenario 'using google oauth2' do
    stub_omniauth
    visit root_path
    expect(page).to have_link('Sign in with Google')
    click_link 'Sign in with Google'
    expect(page).to have_content('Michael Siegfried')
    expect(page).to have_link('Logout')
  end
end

# rubocop:disable Metrics/MethodLength
def stub_omniauth
  OmniAuth.config.test_mode = true
  OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new(
    provider: :google,
    uid: '12345678910',
    info: {
      email: 'michael@procore.com',
      first_name: 'Michael',
      last_name: 'Siegfried'
    },
    credentials: {
      token: 'abcdefg12345',
      refresh_token: '12345abcdefg',
      expires_at: DateTime.now
    }
  )
end
