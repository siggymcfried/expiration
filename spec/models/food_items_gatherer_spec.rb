# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FoodItemsGatherer do
  let(:user) { FactoryGirl.create(:user) }
  let(:status) { :expiring }
  let(:page) { 1 }
  let(:gatherer) { described_class.new(user: user, status: status, page: page) }

  let(:expired_1) { FactoryGirl.create(:food, expiration: 1.day.ago, user: user) }
  let(:expired_2) { FactoryGirl.create(:food, expiration: 1.day.ago, user: user) }
  let(:eaten) { FactoryGirl.create(:food, eaten_on: 1.day.ago, expiration: 1.day.from_now, user: user) }
  let(:trashed) { FactoryGirl.create(:food, expiration: 1.day.ago, trashed_on: 2.days.ago, user: user) }

  context 'with no items' do
    describe '#counts' do
      let(:counts) { gatherer.counts }

      specify do
        expect(counts).to include(all: 0, eaten: 0, expiring: 0, trashed: 0)
      end
    end
  end

  context 'with one eaten and two expired items' do
    let!(:items) { [expired_1, expired_2, eaten] }

    describe '#counts' do
      let(:counts) { gatherer.counts }

      specify do
        expect(counts).to include(all: 3, eaten: 1, expiring: 2, trashed: 0)
      end
    end
  end

  context 'with items of all kinds' do
    let!(:items) { [expired_1, expired_2, eaten, trashed] }

    describe '#counts' do
      let(:counts) { gatherer.counts }

      specify do
        expect(counts).to include(all: 4, eaten: 1, expiring: 2, trashed: 1)
      end
    end
  end
end
