class SongsController < ApplicationController

    def index
        if nested_album_url?
            @album = Album.find_by_id(params[:album_id])
            if @album 
                @songs = @album.songs.all
            else
                redirect_to home_path
            end
        else
            @songs = Album.released_album_songs
        end
    end

    def new
        @song = Song.new(album_id: params[:album_id])
    end

    def create
        @album = Album.find_by_id(params[:album_id])
        @song = @album.songs.build(song_params)
        if @song.save
            redirect_to album_path(@album)
        else
            render :new
        end
    end

    def show
    end

    private

    def song_params
        params.require(:song).permit(:name, :duration, :song_number, :explicit)
    end
end
