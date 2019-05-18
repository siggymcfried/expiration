# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  let(:user) { FactoryBot.create(:user, first_name: 'Bob', last_name: 'By') }

  specify { expect(user.full_name).to eq('Bob By') }
end
