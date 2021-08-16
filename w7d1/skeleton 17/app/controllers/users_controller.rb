class UsersController < ApplicationController
    before_action :require_logged_out, only: [:new, :create]
    
    def create
        @user = User.new(new_user_params)
        if @user.save
            login(@user)
            redirect_to cats_url 
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
        params.require(:user).permit(:user_name, :password)

    end 
end
