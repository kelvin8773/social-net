# frozen_string_literal: true

class FriendshipNoticeMailer < ApplicationMailer
  def friend_request_notice(user, friend)
    @friend = friend
    @user = user

    mail to: @friend.email,
         cc: @user.email,
         subject: "Friend Request Notice - From #{@user.name}."
  end
end
