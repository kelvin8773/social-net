# frozen_string_literal: true

class LikesController < ApplicationController
  before_action :authenticate_user!
  # before_action :find_likeable

  def create
    # byebug
    @like = current_user.likes.build(like_params)

    respond_to do |format|
      if @like.save
        format.html { redirect_to root_url, notice: 'You liked.' }
      else
        format.html { redirect_to root_url, alert: 'You can not like' }
      end
    end
  end

  def destroy
    # byebug
    @like = Like.find_by(id: params[:format])

    if @like.destroy
      flash[:notice] = 'You unliked!'
    else
      flash[:alert] = 'You can not unlike.'
    end
    redirect_to root_url
  end

  private

  def like_params
    params.require(:like).permit(:likeable_type, :likeable_id)
  end
end
