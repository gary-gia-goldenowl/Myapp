class PostsController < ApplicationController
    def list
        @posts = Post.all
    end
end
