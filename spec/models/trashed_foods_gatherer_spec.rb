# frozen_string_literal: true

require 'rails_helper.rb'

describe TrashedFoodsGatherer do
  let(:gatherer) { described_class.new(user: my_user) }
  let(:my_user) { FactoryBot.create(:user, foods: my_user_foods) }
  let!(:other_user_food) { FactoryBot.create(:food) }

  context 'when the user has two trashed foods and one non trashed food' do
    let(:my_user_foods) { [expiring, trashed1, trashed2] }

    let(:expiring) { FactoryBot.create(:food, :expiring) }
    let(:trashed1) { FactoryBot.create(:food, :trashed) }
    let(:trashed2) { FactoryBot.create(:food, :trashed) }

    describe '#foods' do
      let(:food_ids) { gatherer.foods.map(&:id) }

      it "includes the user's trashed foods" do
        expect(food_ids).to include(trashed1.id, trashed2.id)
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
