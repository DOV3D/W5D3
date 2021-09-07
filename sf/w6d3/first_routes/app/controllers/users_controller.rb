class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
        # render plain: 'Im in the index action!'
    end

    def show
        @users = User.find_by 

    end 

    def create
        # @user = User.new(params)
        # @user.id = User.first.id

        # if @user.save 
        #     redirect_to user_url(@user)
        # else
        #     render json: @user.errors.full_messages, status: 422
        # end
        # render json: params 

        @user = User.new(user_params)
        # replace the `user_attributes_here` with the actual attribute keys
        # user.save!
        if @user.save
            render json: @user
        else
            render json: { error: @user.errors.full_messages }, status: 422
        end
        
    end

    def show
        render json: params
    end

    private 

    def user_params
        params.require(:user).permit(:username)
    end 

end