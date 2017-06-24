# frozen_string_literal: true

namespace :expiration do
  desc 'Sends emails for expiring food'
  task email_notifications: :environment do
    User.with_expired_or_expiring_food.distinct.each do |user|
      FoodsMailer.food_status_email(user).deliver_now
    end
  end
end
