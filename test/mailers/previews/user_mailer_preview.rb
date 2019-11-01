# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def facebook_register_welcome
    @user = User.first
    @password = "Password"

    UserMailer.facebook_register_welcome(@user, @password)
  end

end
