# frozen_string_literal: true

require 'rails_helper.rb'

describe Food do
  describe 'eaten' do
    it 'should be true' do
      expect(Food.new.eaten?).to be false
    end
  end
end
