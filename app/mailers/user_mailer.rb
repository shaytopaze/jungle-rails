class UserMailer < ApplicationMailer
  default from: 'notifications@example.com'

  def welcome_email(user, order)
    @order = order
    @user = user
    @url  = 'http://example.com/login'
    mail(to: order.email, subject: "Thanks for making an order #{order.id}" )
  end
end
