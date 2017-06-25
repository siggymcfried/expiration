# frozen_string_literal: true

class GoogleOauthUser
  def initialize(oauth_hash)
    @oauth_hash = oauth_hash
    @user = User.where('uid = :uid OR email = :email', uid: uid, email: email).first_or_initialize
  end

  def update_or_create
    user.tap { |user| user.update!(params) }
  end

  private
  attr_reader :oauth_hash, :user

  def uid
    oauth_hash.fetch(:uid)
  end

  def email
    oauth_hash[:info][:email]
  end

  # rubocop:disable Metrics/AbcSize
  def params
    {
      uid:              oauth_hash[:uid],
      provider:         oauth_hash[:provider],
      email:            oauth_hash[:info][:email],
      first_name:       oauth_hash[:info][:first_name],
      last_name:        oauth_hash[:info][:last_name],
      token:            oauth_hash[:credentials][:token],
      refresh_token:    oauth_hash[:credentials][:refresh_token],
      oauth_expires_at: Time.at(oauth_hash[:credentials][:expires_at]).to_datetime.utc
    }
  end
end
