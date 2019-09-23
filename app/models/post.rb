# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :content, presence: true, length: { minimum: 10, maximum: 500 }
  default_scope { order(created_at: :desc) }
end
