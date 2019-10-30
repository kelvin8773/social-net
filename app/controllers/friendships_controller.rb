class FriendshipsController < ApplicationController

  def create
    @friendship = Friendship.new(friendship_params)
    return unless @friendship.save

    flash[:sucess] = "Friend request have been sent!"
    redirect_to users_index_path
  end

  def confirm
    @user = User.find_by(id: params[:id])
    return unless current_user.confirm_friend(@user)

    flash[:sucess] = "Friend request confirmed."
    redirect_to friends_path
  end

  def destroy
    @user = User.find_by(user_id: params[:id])
    return unless current_user.friends.delete(@user)
    flash[:danger] = "Friend Removed!!!"
    redirect_to users_path
  end

  def cancel
    @user = User.find_by(id: params[:id])
    current_user.cancel_friend_request(@user)
    flash[:success] = 'Friend Request Canceled'
    redirect_to friends_path
  end

  def ignore
    @user = User.find_by(id: params[:id])
    @friendship = Friendship.find { |f| f.user_id == @user.id }
    @friendship.destroy
    flash[:danger] = 'Friend Request Ignored'
    redirect_to friends_path
  end

  private

  def friendship_params 
    params.require(:friendship).permit(:user_id, :friend_id)
  end

end
