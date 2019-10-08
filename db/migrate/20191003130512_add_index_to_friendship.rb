# frozen_string_literal: true

class AddIndexToFriendship < ActiveRecord::Migration[6.0]
  def change
    add_index :friendships, %i[user_id friend_id]
  end
end
