# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExpirationDate do
  describe '#calculate' do
    let(:expiration_date) { described_class.new('strawberries') }

    context 'when the food has been added before' do
      before { FactoryBot.create(:food, name: 'strawberries', expiration: 3.days.ago, created_at: 9.days.ago) }

      it 'uses the expiration length of the last food' do
        expect(expiration_date.calculate).to eq(6.days.from_now.to_date)
      end
    end

    context 'when the food has not been added before' do
      it 'defaults to today' do
        expect(expiration_date.calculate).to eq(Date.today)
      end
    end
  end
end
