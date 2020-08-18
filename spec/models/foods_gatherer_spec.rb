# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FoodsGatherer do
  let(:gatherer) { described_class.new(user: user, status: status, page: page) }
  let(:user) { FactoryBot.build_stubbed(:user) }
  let(:status) { :expiring }
  let(:page) { 1 }

  describe '#counts' do
    let(:counts) { gatherer.counts }

    context 'when there is one eaten, 2 trashed, and 3 expiring foods' do
      before do
        allow(AllFoodsGatherer).to      receive(:new).and_return(OpenStruct.new(count: 6))
        allow(EatenFoodsGatherer).to    receive(:new).and_return(OpenStruct.new(count: 1))
        allow(TrashedFoodsGatherer).to  receive(:new).and_return(OpenStruct.new(count: 2))
        allow(ExpiringFoodsGatherer).to receive(:new).and_return(OpenStruct.new(count: 3))
      end

      specify { expect(counts).to match(all: 6, eaten: 1, trashed: 2, expiring: 3) }
    end
  end

  describe '#foods' do
    let(:foods) { gatherer.foods }
    let(:expiring_gatherer) { instance_spy(ExpiringFoodsGatherer, foods: Food.none, count: 5) }

    before { allow(ExpiringFoodsGatherer).to receive(:new).with(user: user).and_return(expiring_gatherer) }

    it 'calls food on the apporpriate gatherer' do
      foods

      expect(expiring_gatherer).to have_received(:foods)
    end
  end
end
