class AlbumsController < ApplicationController
    before_action :check_unauthenticated_redirect_needed, only: [:index, :show]
    before_action :check_if_logged_in_creator, only: [:edit, :destroy]
    before_action :check_album_exists, only: [:edit, :destroy]
    before_action :check_if_creator_owns_album, only: [:edit, :destroy]

    def index
        if params[:category].present?
            @selected_category = params[:category].downcase!
            if @selected_category == "edm"
                @albums = Album.edm_music   
            end
        else
            @albums = Album.released_albums
        end
    end

    def new
        if logged_in_creator?
            @album = Album.new
        else
            redirect_to home_path
        end
    end

    def create
        if logged_in_creator?
            @album = current_creator.albums.build(album_params)
            if @album.save
                redirect_to album_path(@album)
            else
                render :new
            end
        else
            redirect_to '/'
        end
    end

    def show
        check_album_exists
    end

    def edit
    end

    def destroy
        @album.destroy
        redirect_to albums_path
    end
    
    private

    def check_if_logged_in_creator
        if !logged_in_creator?
            redirect_to home_path
        end
    end

    def check_album_exists
        @album = Album.find_by_id(params[:id])
        if !@album
            redirect_to home_path
        end
    end

    def check_if_creator_owns_album
        @album = Album.find_by_id(params[:id])
        if @album
            if @album.creator_id != session[:creator_id]
                redirect_to home_path
            end
        else    
            redirect_to home_path
        end
    end
    
    def album_params
        params.require(:album).permit(:name, :category, :release_date, :released)
    end
end
