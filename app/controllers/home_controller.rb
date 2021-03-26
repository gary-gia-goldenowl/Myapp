class HomeController < ApplicationController
  def index
      @posts = Post.all
      @users = User.all
      @categories = Category.all
  end
  
end
