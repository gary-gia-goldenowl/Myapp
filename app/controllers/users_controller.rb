class UsersController < ApplicationController
    
    def index
        @users = User.all
        @categories = Category.all
    end
  
    def show
        @users = User.find(params[:id])
    end
end
