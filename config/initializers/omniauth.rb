# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  # rubocop:disable Style/BracesAroundHashParameters
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET'], {
    access_type: :offline,
    name:        :google,
    prompt:      :select_account
  }
  # rubocop:enable Style/BracesAroundHashParameters
end
