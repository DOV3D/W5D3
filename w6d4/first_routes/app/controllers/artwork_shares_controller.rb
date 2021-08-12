class ArtworkSharesController < ApplicationController

    def index
        artwork_shares = ArtworkShares.all
        render json: artwork_shares
        
    end

    def show
        artwork_shares = ArtworkShares.find(params[:id])
        render json: artwork
    end



    def destroy 
        artwork_shares = ArtworkShares.find_by(id: params[:id])

        if artwork_shares
            artwork_shares.destroy
            redirect_to artwork_shares_url 
        end 
    end 

    def update
        artwork = Artwork.find_by(id: params[:id])

        if artwork.update(artwork_params)
            redirect_to artwork_url(artwork)
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    private 
    def artwork_params 
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end 

end 