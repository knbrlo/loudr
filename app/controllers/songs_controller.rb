class SongsController < ApplicationController

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

        @new_song = @album.songs.build(song_params)

        if @new_song.save
            p 'New song is '
            p @new_song

            # todo - reroute back to the album show page and show all the songs for the album
            redirect_to album_path(@album)
        else
            p 'Didnt make new song'
        end
        
    end

    private

    def song_params
        params.require(:song).permit(:name, :duration, :song_number, :explicit)
    end

end
