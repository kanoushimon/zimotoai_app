class PostsController < ApplicationController
  # before_action :logged_in_user, only: [:new, :create, :edit, :update]
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:post])
    if @post.save
      flash[:success] = "思い出が記録されました。"
    else
      flash[:notice] = "思い出が記録できませんでした。"
    end
    render 'new'
  end
  
  def show
    @post = Post.find(params[:id])
  end
  
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      flash[:success] = "思い出が更新されました。"
      redirect_to @post
    else
      flash[:notice] = "思い出が更新できませんでした。"
      render 'edit'
    end
  end
  
  private
  
  def post_params
    params.require(:post).permit(:content)
  end

end
