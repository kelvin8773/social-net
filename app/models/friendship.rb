# frozen_string_literal: true

class Friendship < ApplicationRecord
  belongs_to :user
  belongs_to :friend, class_name: 'User'

  validates :user, uniqueness: { scope: :friend }
  validate :user_and_friend_are_different

  def user_and_friend_are_different
    errors.add(:friend_id, "can't be same as user") if user_id == friend_id
  end
end
