class UsersController < ApplicationController
    
    def index
        @users = User.all
        @categories = Category.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.new(my_params)
        if !@user.save
            render :new
        else
            redirect_to users_path
        end 
    end

    def update
        @user = User.find(params[:id])
        
        if @user.update(my_params)
            redirect_to user_path
        else
            render action: :edit
        end
    end
    
    def edit
        @user = User.find(params[:id])
    end

    def destroy
        @user = User.find(params[:id]).destroy
        if !@user.save
            render :new
        else
            redirect_to users_path
        end 
        # redirect_to users_path
    end



    private
    def my_params
        params.require(:user).permit(:first_name, :last_name, :email, :gender, :age, :role)
    end
end
