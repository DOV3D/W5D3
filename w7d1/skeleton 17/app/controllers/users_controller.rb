class UsersController < ApplicationController

    def create
        @user = User.new(new_user_params)
        if user.save
            redirect_to users_url 
        else 
            render :new 
        end 

    end 

    def new 
        @user = User.new
        render :new 

    end 

    private 
    def new_user_params 
        params.require(:user).permit(:user_name, :password_digest, :session_token)

    end 
end
