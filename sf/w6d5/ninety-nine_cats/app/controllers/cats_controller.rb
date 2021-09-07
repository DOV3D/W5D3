class CatsController < ApplicationController
    def index
        @cats = Cat.all
        # render json: @cats
        render :index
        # render :show
        # redirect_to cats_url
    end
end
