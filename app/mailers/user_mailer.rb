class UserMailer < ApplicationMailer

  def facebook_register_welcome(user, initial_password)
    @user = user
    @password = initial_password

    mail to: @user.email,
         subject: "Welcome register to Social-Network via Facebook!" 
  end
end
