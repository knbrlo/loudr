class SongsController < ApplicationController

    def new
        @song = Song.new(album_id: params[:album_id])

        # todo - get the highest song id from the album and pass it through to the form + 1
        # todo - set a limit on the song number don't let them go lower than the current song id + 1
    end

    def create
        puts "make a new song for this album"
        puts params
    end

end
