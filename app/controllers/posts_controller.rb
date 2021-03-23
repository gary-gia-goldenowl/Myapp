class PostsController < ApplicationController

    def index
        if params[:user_id]
            @posts = User.find(params[:user_id]).posts
        else
            @posts = Post.all
        end    
    end

    def show
        @post = Post.find(params[:id])

        #if !@posts
            #redirect_to users_path
        #end
    end

    def new
        @user = User.find(params[:user_id])
        @category = Category.find(params[:category_id])
        @post = Post.new(user_id: params[:user_id], category_id: params[:category_id])
    end

    def create
        @post = Post.new(my_params)

        if !@post.save
            render :new
        else
            redirect_to posts_path
        end
    end

    def update
        @post = Post.find(params[:id])
        
        if @post.update(my_params)
            redirect_to post_path
        else
            render action: :edit
        end
    end
    
    def edit
        @post = Post.find(params[:id])
    end

    def destroy
        @post = Post.find(params[:id]).destroy
        if !@post.save
            render :new
        else
            redirect_to post_path
        end 
    end
    
    private
    def my_params
        params.require(:post).permit(:user_id, :category_id, :title, :content, :images)
    end
end
