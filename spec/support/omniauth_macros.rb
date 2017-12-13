# frozen_string_literal: true

module OmniAuthMacros
  def mock_auth_hash(user: FactoryGirl.create(:user), expires_at: 1.day.from_now)
    OmniAuth.config.mock_auth[:google] = OmniAuth::AuthHash.new(
      provider: :google,
      uid: user.uid,
      info: user_info_for(user: user),
      credentials: credentials(expiring_at: expires_at)
    )
  end

  private
  def user_info_for(user:)
    {
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name
    }
  end

  def credentials(expiring_at:)
    {
      token: 'abcdefg12345',
      refresh_token: '12345abcdefg',
      expires_at: expiring_at
    }
  end
end
