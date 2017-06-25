# frozen_string_literal: true

module OmniAuthMacros
  # rubocop:disable Metrics/MethodLength
  def mock_auth_hash(expires_at: 1.day.from_now)
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new(
      provider: :google,
      uid: '123456789',
      info: {
        email: 'michael@procore.com',
        first_name: 'Michael',
        last_name: 'Siegfried'
      },
      credentials: {
        token: 'abcdefg12345',
        refresh_token: '12345abcdefg',
        expires_at: expires_at
      }
    )
  end
end
