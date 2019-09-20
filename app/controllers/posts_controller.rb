class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  
  def index
    @post = Post.new
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
 
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to root_url, notice: 'Post was successfully created.' }
      else
        format.html { render :index }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to root_url, notice: 'Post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
    end
  end

  private

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:content, :picture, :user_id)
    end
end
