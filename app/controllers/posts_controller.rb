class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "素敵な思い出が記録されました。"
      redirect_to posts_path
    else
      flash[:notice] = "思い出が記録できませんでした。"
      render 'new'
    end
  end
  
  def show
  end
  
  def edit
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "思い出が更新されました。"
    else
      flash[:notice] = "思い出が更新できませんでした。"
    end
    redirect_to @post
  end
  
  def destroy
    @post.destroy
    flash[:success] = "投稿が削除されました。"
    redirect_to root_url
  end
  
  private
  
  def post_params
    params.require(:post).permit(:name, :text, :content, :image)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end