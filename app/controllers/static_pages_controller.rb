class StaticPagesController < ApplicationController
  def home
  end

  def about
  end
  
  def contact
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    else
      flash[:info] = "思い出シェアにはログインが必要です。"
      redirect_to login_path
    end
  end
end
