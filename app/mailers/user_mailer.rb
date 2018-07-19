class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'
  def order_email(user: user, order: order)
    @user = user
    @order = order
    mail(to: @user.email, subject: "Your order \# #{@order.id} has been placed.")
  end

end
