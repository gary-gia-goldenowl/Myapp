class CategoriesController < ApplicationController
    
    
    def index
        if params[:user_id]
            @categories = User.find(params[:user_id]).categories
        else
            @categories = Category.all
        end
    end

    def show
        @category = Category.find(params[:id])
    end

    def new
        @user = User.find(params[:user_id])
        @category = @user.categories.new 
    end

    def create
        @category = Category.create(my_params)
        if !@category.save
            render :new
        else
            redirect_to categories_path
        end
    end

    def update
        @category = Category.find(params[:id])
        
        if @category.update(my_params)
            redirect_to category_path
        else
            render action: :edit
        end
    end
    
    def edit
        @category = Category.find(params[:id])
    end

    def destroy
        @category = Category.find(params[:id]).destroy
        if !@category.save
            render :new
        else
            redirect_to post_path
        end 
    end

    private
    def my_params
        params.require(:category).permit(:user_id, :title, :description)
    end
end
