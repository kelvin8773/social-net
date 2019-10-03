class AddIndexToFriendship < ActiveRecord::Migration[6.0]
  def change
    add_index :friendships, [:user_id, :friend_id]
  end
end
