class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(params[:id])
    if @post.save
      flash[:success] = "思い出が記録されました。"
      render 'new' 
    else
      flash[:notice] = "思い出が記録できませんでした。"
      render 'new'
    end
  end
  
  def show
    @post = Post.find(params[:id])
  end

end
