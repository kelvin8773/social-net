# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable

  validates :content, presence: true, length: { maximum: 200 }

  def liked?(user)
    likes.find_by(user_id: user.id)
  end
end
