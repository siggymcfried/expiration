# frozen_string_literal: true

class FoodItemMailer < ApplicationMailer
  default from: 'notifications@expiration.xyz'

  def food_status_email(user)
    @user = user
    @expired_items = user.food_items.expired.not_eaten.not_trashed.ordered
    @expiring_items = user.food_items.expiring_by(1.week.from_now).expiring_after(Time.current).not_eaten.not_trashed.ordered

    mail(to: @user.email, subject: 'Your food is expiring soon!')
  end
end
