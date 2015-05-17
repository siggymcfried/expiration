require 'rails_helper.rb'

describe FoodItem do
  describe 'eaten' do
    it 'should be true' do
      expect(FoodItem.new.eaten?).to be true
    end
  end
end

