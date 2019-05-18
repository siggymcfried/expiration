# frozen_string_literal: true

require 'rails_helper.rb'

describe ExpiringFoodsGatherer do
  let(:gatherer) { described_class.new(user: my_user) }
  let(:my_user) { FactoryGirl.create(:user, foods: my_user_foods) }
  let!(:other_user_food) { FactoryGirl.create(:food) }

  context 'when the user has two expiring foods and one non expiring food' do
    let(:my_user_foods) { [expiring1, expiring2, trashed] }

    let(:expiring1) { FactoryGirl.create(:food, :expiring) }
    let(:expiring2) { FactoryGirl.create(:food, :expiring) }
    let(:trashed) { FactoryGirl.create(:food, :trashed) }

    describe '#foods' do
      let(:food_ids) { gatherer.foods.map(&:id) }

      it "includes the user's expiring foods" do
        expect(food_ids).to include(expiring1.id, expiring2.id)
      end

      it "does not include the user's other foods" do
        expect(food_ids).not_to include(trashed.id)
      end

      it "does not include another user's foods" do
        expect(food_ids).not_to include(other_user_food.id)
      end
    end

    describe '#count' do
      specify { expect(gatherer.count).to eq(2) }
    end
  end
end
