# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FoodsHelper do
  describe '#freshness_of' do
    let(:freshness) { helper.freshness_of(food) }

    context 'when the food already expired' do
      let(:food) { instance_spy(Food, expiration: 1.day.ago) }

      specify { expect(freshness).to eq('danger') }
    end

    context 'when the food expires in the next week' do
      let(:food) { instance_spy(Food, expiration: 1.day.from_now) }

      specify { expect(freshness).to eq('warning') }
    end

    context 'when the food expires in more than one week' do
      let(:food) { instance_spy(Food, expiration: 8.day.from_now) }

      specify { expect(freshness).to eq('success') }
    end
  end
end
