# frozen_string_literal: true

# Preview all emails at http://localhost:3000/rails/mailers/friendship_notice_mailer
class FriendshipNoticeMailerPreview < ActionMailer::Preview
  def friend_request_notice
    @user = User.first
    @friend = User.last
    FriendshipNoticeMailer.friend_request_notice(@user, @friend)
  end
  
end
