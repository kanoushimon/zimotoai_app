class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])  
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "地元あいへようこそ！"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
