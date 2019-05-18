# frozen_string_literal: true

require 'rails_helper.rb'

describe Food do
  let(:food) { FactoryBot.create(:food) }

  context 'when thrown out' do
    specify { expect { food.throw_out! }.to change(food, :trashed?).from(false).to(true) }
  end

  context 'when eaten' do
    specify { expect { food.finish_eating! }.to change(food, :eaten?).from(false).to(true) }
  end
end
