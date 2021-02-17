class AlbumsController < ApplicationController

    def index
        
        if params[:category].present?
        
            @selected_category = params[:category].downcase!

            # http://localhost:3000/albums?category=EDM
            
            if @selected_category == "edm"
                @albums = Album.edm_music   
            end
        else
            @albums = Album.all
        end

    end

    def new
        @album = Album.new
    end

    def create
        @album = current_creator.albums.build(album_params)

        # if the album is successfully saved then proceed and redirect to the next page
        if @album.save
            
            # send the user to the album detail page where they can add songs
            redirect_to album_path(@album)
        else
            # send the user back to the new album page
            render :new
        end
    end

    def show
        @album = Album.find_by_id(params[:id])
    end
    

    private
    
    def album_params
        params.require(:album).permit(:name, :category, :release_date, :released)
    end
end
