class UserMailer < ApplicationMailer
  default from: 'notifications@localhost3000.com'

  def welcome_email(user)
    @user = user
    @url = "localhost:3000/sessions/new"
    mail(to: user.email, subject: "Welcome to localhost:3000!")
  end
end
