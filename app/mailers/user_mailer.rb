class UserMailer < ApplicationMailer
  default from: 'test@example.com'

  def hoge_email
    @user = params[:user]
    @url  = 'localhost:3000/login'
    mail(to: @user.email, subject: 'MyProjectへようこそ')
  end
end
