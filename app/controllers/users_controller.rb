class UsersController < ApplicationController
  def index
    @posts = Post.all
    if params[:user_id]
      @user = User.find(params[:user_id])
      @posts = @user.posts.order(created_at: "DESC")
    else
      @posts = Post.order(created_at: "DESC")
    end  
  end
end
