# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GoogleOauthUser do
  let(:google_user) { described_class.new(oauth_hash) }
  let(:oauth_hash) do
    {
      provider:    'google',
      uid:         uid,
      info: {
        email:      'siggy@gmail.com',
        first_name: 'Michael',
        last_name:  'Siegfried'
      },
      credentials: {
        token:         'abcdefg12345',
        refresh_token: '12345abcdefg',
        expires_at:    expires_at
      }
    }
  end
  let(:uid) { '12345678910' }
  let(:expires_at) { Time.now.utc }

  describe '#update_or_create' do
    let(:update_or_create) { google_user.update_or_create }
    let(:user) { User.find_by(uid: uid) }

    context 'when there is no user for that uid' do
      it 'creates the user with the oauth attributes' do
        update_or_create

        expect(user.attributes.with_indifferent_access).to include(
          provider: 'google',
          uid: uid,
          email: 'siggy@gmail.com',
          first_name: 'Michael',
          last_name: 'Siegfried',
          token: 'abcdefg12345',
          refresh_token: '12345abcdefg',
          oauth_expires_at: within(1.second).of(expires_at)
        )
      end
    end

    context 'when there is a user for that uid' do
      before { FactoryGirl.create(:user, uid: uid, email: 'michael@gmail.com') }

      it 'updates the user' do
        expect { update_or_create }.to change { User.find_by(uid: uid).email }.from('michael@gmail.com').to('siggy@gmail.com')
      end
    end
  end
end
