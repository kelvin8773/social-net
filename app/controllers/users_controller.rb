# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.where('id != ?', current_user.id)
    @not_friends = @users.filter { |user| !current_user.friends.include?(user) }
    @friendship = Friendship.new
  end

  def show
    @post = Post.new
    @comment = Comment.new
    @like = Like.new
    @users = User.all
    @user = User.find_by(id: params[:id])
    @myposts = Post.where(user_id: @user.id)
  end
end
