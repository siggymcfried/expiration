# frozen_string_literal: true

require 'rails_helper'

RSpec.feature "Change food's status" do
  scenario 'user eats food' do
    food = FactoryGirl.create(:food, name: 'Yummy food')

    visit root_path
    mock_auth_hash(user: food.user)
    click_link 'Sign in with Google'

    expect(page).to have_text('Yummy food')
    click_button "eat_food_#{food.id}"
    expect(page).to_not have_text('Yummy food')

    click_link 'filter_by_status_eaten'
    expect(page).to have_text('Yummy food')
  end

  scenario 'user trashes food' do
    food = FactoryGirl.create(:food, name: 'Old food')

    visit root_path
    mock_auth_hash(user: food.user)
    click_link 'Sign in with Google'

    expect(page).to have_text('Old food')
    click_button "trash_food_#{food.id}"
    expect(page).to_not have_text('Old food')

    click_link 'filter_by_status_trashed'
    expect(page).to have_text('Old food')
  end
end
