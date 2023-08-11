class UserMailer < ApplicationMailer

  def forgot(user)
    @user = user
    @token = @user.reset_password_token
    mail(to: @user.email, subject: "forgot password?")
  end  
end
