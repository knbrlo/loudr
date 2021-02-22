class SongsController < ApplicationController

    # todo - assessment feedback
    # todo - missing nested routes for songs 
    # 11am 26th.
    # todo - remove the comments so that I can speak about it without hints.
    # make the code more DRY.
    # todo - clear out puts statements.
    # todo - this needs to look more like a finished product.
    # todo - if i pass in an album that doesn't exist, fix that.
    # todo - new branch, see if can combine the creator and user model. (extra) (bonus)
    # todo - use more before actions in controllers.
    # todo - redo the video (focus on the functionality)
    # todo - nested and wrong nested routes (account, edit account etc.)
    # todo - if foreign key doesn't exist, then handle changes.


    def index
        
        # todo - if the route contains an album, then follow this path
        @album = Album.find_by_id(params[:album_id])

    end

    def new

        @song = Song.new(album_id: params[:album_id])

        # todo - get the highest song id from the album and pass it through to the form + 1
        # todo - set a limit on the song number don't let them go lower than the current song id + 1
    end

    def create
        puts "make a new song for this album"
        puts params[:album_id]
        @album = Album.find_by_id(params[:album_id])

        puts "album is:"
        puts @album

        @song = @album.songs.build(song_params)

        if @song.save
            p 'New song is '
            p @song

            # todo - reroute back to the album show page and show all the songs for the album
            redirect_to album_path(@album)
        else
            p 'Didnt make new song'
            # send the user back to the new song page
            render :new
        end
        
    end

    private

    def song_params
        params.require(:song).permit(:name, :duration, :song_number, :explicit)
    end

end
