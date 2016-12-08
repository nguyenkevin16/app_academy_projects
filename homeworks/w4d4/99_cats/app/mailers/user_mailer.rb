class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email(user)
    @user = user
    @url  = 'localhost:3000/cats'
    mail(to: user.email, subject: 'Welcome to 99 cats!')
  end
end
