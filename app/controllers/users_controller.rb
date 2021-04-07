class UsersController < ApplicationController

    def index
        @users = User.order("first_name ASC")
        @user = User.new
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
        respond_to do |format|
            @errorName = []
            @errorEmail = []
            @errorEmail2 = []
            @errorGender = []
            @errorGender2 = []
            @errorAge = []
            @errorRole = []
            @errorRole2 = []
            if @user.save
                format.html { redirect_to @user, notice: 'User was successfully created.' }
                format.js   {}
                format.json { render json: @user, status: :created, location: @user }

            else
                format.html { render action: "new" }
                format.js
                format.json { render json: @user.errors, status: :unprocessable_entity }

                if (@user.errors["first_name"] != nil)
                    @errorName.push(@user.errors["first_name"][0])
                end

                if (@user.errors["email"] != nil)
                    @errorEmail.push(@user.errors["email"][0])
                    @errorEmail2.push(@user.errors["email"][1])
                end
                
                if (@user.errors["gender"] != nil)
                    @errorGender.push(@user.errors["gender"][0])
                    @errorGender2.push(@user.errors["gender"][1])
                end

                if (@user.errors["age"] != nil)
                    @errorAge.push(@user.errors["age"][0])
                end

                if (@user.errors["role"] != nil)
                    @errorRole.push(@user.errors["role"][0])
                    @errorRole2.push(@user.errors["role"][1])

                end
            end
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

        respond_to do |format|
            format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
            format.json { head :no_content }
            format.js   { render layout: false }
            
            #format.js { render :action => 'destroy' }
        end
    end

    def male
        @users = User.order("first_name ASC")
        @males = @users.male
    end

    def female
        @users = User.order("first_name ASC")
        @females = @users.female
    end

    def top
        @users = User.joins(:posts).group('users.id').having('count(posts) >3').order("count(posts.user_id) desc")
    end

    private
    def my_params
        params.require(:user).permit(:first_name, :last_name, :email, :gender, :age, :role, :avatar)
    end
end
