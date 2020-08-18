# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FoodsMailer do
  describe '#food_status_email' do
    let(:mail) { described_class.food_status_email(user).deliver_now }

    let(:user) { FactoryBot.create(:user, email: 'foo@bar.com') }
    let(:eaten_food)    { FactoryBot.create(:food, :eaten,    name: 'Eaten food', user: user) }
    let(:expired_food)  { FactoryBot.create(:food, :expired,  name: 'Expired Food', user: user) }
    let(:expiring_food) { FactoryBot.create(:food, :expiring, name: 'Expiring Food', user: user) }
    let(:trashed_food)  { FactoryBot.create(:food, :trashed,  name: 'Trashed Food', user: user) }

    describe 'the subject' do
      specify { expect(mail.subject).to eq('Your food is expiring soon!') }
    end

    describe 'the sender email' do
      specify { expect(mail.from).to contain_exactly('notifications@expiration.xyz') }
    end

    describe 'the receiver email' do
      it 'equals the user email' do
        expect(mail.to).to contain_exactly('foo@bar.com')
      end
    end

    describe 'the email body' do
      let(:body) { mail.body.encoded }

      context 'with one of every kind of item' do
        before do
          eaten_food
          expired_food
          expiring_food
          trashed_food
        end

        specify { expect(body).to match('1 Expired Items') }
        specify { expect(body).to match(expired_food.name) }
        specify { expect(body).to match('1 Items Expiring in the Next Week') }
        specify { expect(body).to match(expiring_food.name) }
        specify { expect(body).not_to match(eaten_food.name) }
        specify { expect(body).not_to match(trashed_food.name) }
      end

      context 'when there are no expired items' do
        before do
          eaten_food
          expiring_food
          trashed_food
        end

        specify { expect(body).to match('There are no expired items.') }
      end

      context 'when there are no items expiring in the next week' do
        before do
          eaten_food
          expired_food
          trashed_food
        end

        specify { expect(body).to match('There are no items expiring in the next week.') }
      end
    end
  end
end
