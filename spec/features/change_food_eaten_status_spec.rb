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

  scenario 'user recovers eaten food' do
    food = FactoryGirl.create(:food, :eaten, name: 'Misplaced Food')

    visit root_path
    mock_auth_hash(user: food.user)
    click_link 'Sign in with Google'

    click_link 'filter_by_status_eaten'
    expect(page).to have_text('Misplaced Food')

    click_link "edit_food_#{food.id}"
    fill_in 'food_eaten_on', with: ''
    click_button 'Update Food'
    click_link 'filter_by_status_eaten'
    expect(page).to_not have_text('Misplaced Food')

    click_link 'filter_by_status_expiring'
    expect(page).to have_text('Misplaced Food')
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

  scenario 'user recovers trashed food' do
    food = FactoryGirl.create(:food, :trashed, name: 'Questionable Food')

    visit root_path
    mock_auth_hash(user: food.user)
    click_link 'Sign in with Google'

    click_link 'filter_by_status_trashed'
    expect(page).to have_text('Questionable Food')

    click_link "edit_food_#{food.id}"
    fill_in 'food_trashed_on', with: ''
    click_button 'Update Food'
    click_link 'filter_by_status_trashed'
    expect(page).to_not have_text('Questionable Food')

    click_link 'filter_by_status_expiring'
    expect(page).to have_text('Questionable Food')
  end
end