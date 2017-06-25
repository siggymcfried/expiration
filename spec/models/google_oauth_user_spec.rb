# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GoogleOauthUser do
  let(:google_user) { described_class.new(oauth_hash) }
  let(:uid) { '12345678910' }
  let(:oauth_hash) do
    {
      provider:    'google',
      uid:         uid,
      info:        info_hash,
      credentials: credentials_hash
    }
  end
  let(:info_hash) do
    {
      email:      'siggy@gmail.com',
      first_name: 'Michael',
      last_name:  'Siegfried'
    }
  end

  let(:credentials_hash) do
    {
      token:         'abcdefg12345',
      refresh_token: '12345abcdefg',
      expires_at:    DateTime.now.utc
    }
  end

  describe '#update_or_create' do
    let(:update_or_create) { google_user.update_or_create }
    let(:user) { User.find_by(uid: uid) }

    context 'when there is no user for that uid' do
      before { update_or_create }

      it 'sets the provider' do
        expect(user.provider).to eq(oauth_hash[:provider])
      end

      it 'sets the uid' do
        expect(user.uid).to eq(oauth_hash[:uid])
      end

      it 'sets the email' do
        expect(user.email).to eq(oauth_hash[:info][:email])
      end

      it 'sets the first_name' do
        expect(user.first_name).to eq(oauth_hash[:info][:first_name])
      end

      it 'sets the last_name' do
        expect(user.last_name).to eq(oauth_hash[:info][:last_name])
      end

      it 'sets the token' do
        expect(user.token).to eq(oauth_hash[:credentials][:token])
      end

      it 'sets the refresh_token' do
        expect(user.refresh_token).to eq(oauth_hash[:credentials][:refresh_token])
      end

      it 'sets the expires_at' do
        expect(user.oauth_expires_at).to be_within(1.second).of(oauth_hash[:credentials][:expires_at])
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
