class FoodItemMailer < ApplicationMailer
  default from: 'notifications@expiration.xyz'

  def food_status_email(user)
    @user = user
    @expired_items = user.food_items.expired
    @expiring_items = user.food_items.expiring_by(1.week.from_now).expiring_after(Date.today)

    mail(to: @user.email, subject: 'Foods')
  end
end
