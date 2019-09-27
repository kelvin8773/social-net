# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
  end

  def show
    @comment = Comment.new
    @like = Like.new
    @users = User.all
    @user = User.find_by(id: params[:format])
    @myposts = Post.where(user_id: @user.id)
  end
end
