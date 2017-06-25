# frozen_string_literal: true

require 'rails_helper.rb'

describe AllFoodsGatherer do
  let(:gatherer) { described_class.new(user: my_user) }
  let(:my_user) { FactoryGirl.build_stubbed(:user, foods: my_user_foods) }
  let!(:other_user_food) { FactoryGirl.build_stubbed(:food) }

  context 'when the user has one of each type of food' do
    let(:my_user_foods) { [eaten, expiring, expired, trashed] }

    let(:eaten) { FactoryGirl.build_stubbed(:food, :eaten) }
    let(:expiring) { FactoryGirl.build_stubbed(:food, :expiring) }
    let(:expired) { FactoryGirl.build_stubbed(:food, :expired) }
    let(:trashed) { FactoryGirl.build_stubbed(:food, :trashed) }

    describe '#foods' do
      it "includes the user's foods" do
        expect(gatherer.foods.map(&:id)).to match_array(my_user_foods.map(&:id))
      end

      it "does not include another user's foods" do
        expect(gatherer.foods.map(&:id)).to_not include(other_user_food.id)
      end
    end

    describe '#count' do
      specify { expect(gatherer.count).to eq(4) }
    end
  end
end
