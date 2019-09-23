class CommentsController < ApplicationController
  def new
  end

  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      flash[:notice] = 'Comment Saved.'
    else
      flash[:alert] = 'Comment can not be saved.'
    end  
    redirect_to root_url
  end

  def update
  end

  def destroy
  end

  private

    def comment_params
      params.require(:comment).permit(:content, :user_id, :post_id)
    end
end
