class AlbumsController < ApplicationController

    def new
        puts "log 2"
        @album = Album.new
    end

    def create
        @new_album = current_creator.albums.build(album_params)

        # if the album is successfully saved then proceed and redirect to the next page
        if @new_album.save
            
            # send the user to the path for all of their albums
            redirect_to home_creator_path
        else
            # send the user back to the new album page
            puts "log 1"
            render :new
            
            puts album_params
        end
    end
    

    private
    
    def album_params
        params.require(:album).permit(:name, :category, :release_date)
    end
end
