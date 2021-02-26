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

    def show
        redirect_to home_path
    end

    def new
        @album = Album.find_by_id(params[:album_id])
        if @album
            @song = Song.new(album_id: params[:album_id])
        else
            redirect_to home_path
        end
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

    def edit
        check_if_logged_in_creator
        check_album_exists
        check_song_exists
        check_if_creator_owns_album
    end

    private

    def check_if_logged_in_creator
        if !logged_in_creator?
            redirect_to home_path
        end
    end

    def check_album_exists
        @album = Album.find_by_id(params[:album_id])
        if !@album
            redirect_to home_path
        end
    end

    def check_song_exists
        @song = Album.find_by_id(params[:id])
        if !@album
            redirect_to home_path
        end
    end
    
    def check_if_creator_owns_album
        @album = Album.find_by_id(params[:album_id])
        if @album.creator_id != session[:creator_id]
            redirect_to home_path
        end
    end

    def song_params
        params.require(:song).permit(:name, :duration, :song_number, :explicit)
    end
end
