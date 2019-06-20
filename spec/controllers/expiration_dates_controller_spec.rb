# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpirationDatesController do
  let(:user) { FactoryBot.create(:user) }

  describe 'GET show' do
    context 'when the food exists' do
      before { FactoryBot.create(:food, name: 'strawberries', created_at: 6.days.ago, expiration: 4.days.ago) }

      it 'calculates the date' do
        get :show, params: { id: 'strawberries' }, session: { user_id: user.id }, format: :json

        expect(response.body).to eq({ expires_on: 2.days.from_now.to_date }.to_json)
      end
    end

    context 'when the food does not exist' do
      it 'returns today' do
        get :show, params: { id: 'strawberries' }, session: { user_id: user.id }, format: :json

        expect(response.body).to eq({ expires_on: Date.today }.to_json)
      end
    end
  end
end
