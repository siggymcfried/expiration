# frozen_string_literal: true

require 'rails_helper'

describe EatenFoodsGatherer do
  let(:gatherer) { described_class.new(user: my_user) }
  let(:my_user) { FactoryBot.create(:user, foods: my_user_foods) }
  let!(:other_user_food) { FactoryBot.create(:food) }

  context 'when the user has two expiring foods and one non expiring food' do
    let(:my_user_foods) { [eaten1, eaten2, expiring] }

    let(:eaten1) { FactoryBot.create(:food, :eaten) }
    let(:eaten2) { FactoryBot.create(:food, :eaten) }
    let(:expiring) { FactoryBot.create(:food, :expiring) }

    describe '#foods' do
      let(:food_ids) { gatherer.foods.map(&:id) }

      it "includes the user's eaten foods" do
        expect(food_ids).to include(eaten1.id, eaten2.id)
      end

      it "does not include the user's other foods" do
        expect(food_ids).not_to include(expiring.id)
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
