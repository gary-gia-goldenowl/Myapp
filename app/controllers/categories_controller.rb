class CategoriesController < ApplicationController
    
    
    def index
        if params[:user_id]
            @categories = User.find(params[:user_id]).categories
        else
            @categories = Category.all
        end
    end

    def show
        @category = User.find(params[:user_id]).categories
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

    # def update
    #     @user = User.find params[:id]
        
    #     if @user.update(my_params)
    #         redirect_to user_path
    #     else
    #         render action: :edit
    #     end
    # end
    
    # def edit
    #     @user = User.find(params[:id])
    # end

    # def destroy
    #     @user = User.find params[:id].destroy
    # end

    private
    def my_params
        params.require(:category).permit(:user_id, :title, :description)
    end
end
