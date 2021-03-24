class UsersController < ApplicationController

    def index
        @users = User.order("first_name ASC")
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

        if @user.destroyed?
            redirect_to user_path
        else
            render :new
        end 
    end

    def male
        @users = User.all
        @males = @users.male
    end

    def female
        @users = User.all
        @females = @users.female
    end

    def top
        @users = User.joins(:posts).group('users.id').having('count(posts) >3').order("count(posts.user_id) desc")
    end

    private
    def my_params
        params.require(:user).permit(:first_name, :last_name, :email, :gender, :age, :role)
    end
end
